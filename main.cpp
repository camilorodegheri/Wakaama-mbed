/*
 * Author: Edoardo De Marchi
 * Date: 15/02/14
 * Notes: Checks the Ethernet cable connection
*/

// I think it's the key :)

extern "C" {
    #include "wakaama/liblwm2m.h"
}


#include "mbed.h"
#include "EthernetInterface.h"
#include "UDPSocket.h"

#include "SWUpdate.h"

#ifdef WITH_MQTT
#include "MQTTEthernet.h"
#include "MQTTClient.h"
#endif

PwmOut r (p23);
PwmOut g (p24);
PwmOut b (p25);

void led_thread(void const *args) {
   while(1) {
       for(float i = 0.0; i < 1.0 ; i += 0.001) {
        float p = 3 * i;
        r = 1.0 - ((p < 1.0) ? 1.0 - p : (p > 2.0) ? p - 2.0 : 0.0);
        g = 1.0 - ((p < 1.0) ? p : (p > 2.0) ? 0.0 : 2.0 - p);
        b = 1.0 - ((p < 1.0) ? 0.0 : (p > 2.0) ? 3.0 - p : p - 1.0);  ;  
        Thread::wait(1);
      }
   }
}

//ETHERNET
#define ECHO_SERVER_PORT   2000

//char* ip = "192.168.153.153";               // ip
//char* mask = "255.255.255.0";               // mask
//char* gateway = "192.168.153.100";          // gateway
EthernetInterface eth;

UDPSocket udp;


extern "C" {
    extern lwm2m_object_t * get_object_device();
    extern lwm2m_object_t * get_object_firmware();
}

typedef struct
{
    char package_url[400];
    uint8_t state;
    uint8_t supported;
    uint8_t result;
    void (* updatefw_function) (lwm2m_object_t *);
} firmware_data_t;

LocalFileSystem local("local");               // Create the local filesystem under the name "local"

int Init()
{
    r.period(0.001);

    r = 1 ; g = 1 ; b = 1 ;


    // ETHERNET
    // use this for static IP
    //eth.init(ip, mask, gateway);

    // DHCP
    eth.init();


    eth.connect();

    udp.init();
    udp.bind(5683);

    udp.set_blocking(false, 60000);

    printf("IP Address is %s\r\n", eth.getIPAddress());

    return 0;
}

static uint8_t prv_buffer_send(void * sessionH,
                               uint8_t * buffer,
                               size_t length,
                               void * userdata)
{
    Endpoint * connP = (Endpoint*) sessionH;

    if (-1 == udp.sendTo(*connP, (char*)buffer, length))
    {
        return COAP_500_INTERNAL_SERVER_ERROR;
    }
    return COAP_NO_ERROR;
}


void update(lwm2m_object_t* obj) {
    fprintf(stdout, "*** EXEC FW UPDATE *** \n");

    char* package_url = ((firmware_data_t *) (obj->userData) )->package_url;

    fprintf(stdout, "*** PACKAGE URL *** %s \n", package_url);
    char file[200];
    char rootUrl[200];
    memset(file, '\0', 200);
    memset(rootUrl, '\0', 200);
    
    // Split URL in two bits: root path, and software package root filename
    if(strlen(package_url) > 0) {
        for(int i = strlen(package_url) ; i > 0 ; i--) {
            if(package_url[i-1] == '/') {
                strncpy(file, & package_url[i], strlen(& package_url[i]));
                memcpy(rootUrl, package_url, i-1);
                rootUrl[i] = '\0';
                
                fprintf(stdout, "[[ %s --- %s ]] \n", rootUrl, file);

                if(strlen(file) > 0) {
                    if (SWUP_OK == SoftwareUpdate(rootUrl, file));
                }

                break;
            }
        }
    }
    
}

DigitalIn push_on(p12);
DigitalIn push_off(p15);

#ifdef WITH_MQTT
MQTT::Message message;
MQTTEthernet ipstack = MQTTEthernet(eth);
MQTT::Client<MQTTEthernet, Countdown> mqttClient = MQTT::Client<MQTTEthernet, Countdown>(ipstack);

#include "C12832.h"
C12832 lcd(p5, p7, p6, p8, p11);

void messageArrived(MQTT::MessageData& md)
{
    lcd.cls();
    lcd.locate(0,3);
    lcd.puts("Temperature:");


    MQTT::Message &message = md.message;
    printf("Message arrived: qos %d, retained %d, dup %d, packetid %d\n", message.qos, message.retained, message.dup, message.id);
    printf("Payload %.*s\n", message.payloadlen, (char*)message.payload);

    lcd.locate(0,15);
    lcd.puts((char*)message.payload);

}

void pollButtons(void const *args) {
    while(1) {
        char buf[10];
        memset(buf, '\0', 10);
        char* topic = "javaonedemo/eclipse-greenhouse-ben/actuators/light";

        if(push_on) {
            strcpy(buf, "on");
        } else if (push_off) {
            strcpy(buf, "off");
        }

        if(buf[0] != '\0') {
            message.qos = MQTT::QOS0;
            message.retained = false;
            message.dup = false;
            message.payload = (void*)buf;
            message.payloadlen = strlen(buf);
        //    printf("Publishing %s --> %s", topic, buf);
            mqttClient.publish(topic, message);
        }
        Thread::wait(10);
        mqttClient.yield(20);
    }
}
#endif


int main() 
{
    #ifdef BLINK
    Thread thread(led_thread);
    #endif 

    Init();


    #ifdef WITH_MQTT
    char* topic = "javaonedemo/eclipse-greenhouse-ben/sensors/temperature";

    char* hostname = "iot.eclipse.org";
    int port = 1883;

    printf("Connecting to %s:%d\n", hostname, port);
    
    int rc = ipstack.connect(hostname, port);
    if (rc != 0)
        printf("rc from TCP connect is %d\n", rc);
 
    MQTTPacket_connectData data = MQTTPacket_connectData_initializer;       
    data.MQTTVersion = 3;
    data.clientID.cstring = "mbedsamplebenjamin";
    if ((rc = mqttClient.connect(data)) != 0)
        printf("rc from MQTT connect is %d\n", rc);
    
    if ((rc = mqttClient.subscribe(topic, MQTT::QOS1, messageArrived)) != 0)
        printf("rc from MQTT subscribe is %d\n", rc);

    Thread thread_mqtt(pollButtons);

    #endif


    Endpoint client;
    char buffer[1024];
    lwm2m_context_t * lwm2mH = NULL;
    lwm2m_object_t * objArray[3];
    lwm2m_security_t security;
    int result;

    objArray[0] = get_object_device();
    if (NULL == objArray[0])
    {
        fprintf(stderr, "Failed to create Device object\r\n");
        return -1;
    }

    objArray[1] = get_object_firmware();
    ((firmware_data_t*)objArray[1]->userData)->updatefw_function = update;

    fprintf(stdout, "update: %p, userdata: %p \r\n", update, ((firmware_data_t*)objArray[1]->userData)->updatefw_function);

    
        if (NULL == objArray[1])
    {
        fprintf(stderr, "Failed to create Firmware object\r\n");
        return -1;
    }


    lwm2mH = lwm2m_init("myfreakingmbed", 2, objArray, prv_buffer_send, NULL);
    if (NULL == lwm2mH)
    {
        fprintf(stderr, "lwm2m_init() failed\r\n");
        return -1;
    }
    
    Endpoint server;
//    server.set_address("54.228.25.31",5683);
    server.set_address("5.39.83.206",5683); // leshan.eclipse.org

    memset(&security, 0, sizeof(lwm2m_security_t));

    result = lwm2m_add_server(lwm2mH, 123, 0, NULL, BINDING_U, (void *)&server, &security);

    if (result != 0)
    {
        fprintf(stderr, "lwm2m_add_server() failed: 0x%X\r\n", result);
        return -1;
    }

    result = lwm2m_register(lwm2mH);
    if (result != 0)
    {
        fprintf(stderr, "lwm2m_register() failed: 0x%X\r\n", result);
        return -1;
    }


    while (true) {
        printf("loop...\n");
        struct timeval tv;
        result = lwm2m_step(lwm2mH, &tv);

        int n = udp.receiveFrom(client, buffer, sizeof(buffer));
        if (n>0) {
            printf("Received packet from: %s of size %d\n", client.get_address(), n);
            lwm2m_handle_packet(lwm2mH, (uint8_t*)buffer, n, (void*) &server);
        }

        udp.sendTo(server, (char *)" ", 1);
    }
}
