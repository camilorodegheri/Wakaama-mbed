
#if !defined(MQTTETHERNET_H)
#define MQTTETHERNET_H

#include "MQTTmbed.h"
#include "EthernetInterface.h"
#include "MQTTSocket.h"

class MQTTEthernet : public MQTTSocket
{
public:    
    MQTTEthernet()
    {
        eth.init();                          // Use DHCP
        eth.connect();
    }
    
    MQTTEthernet(EthernetInterface& e)
    {
        eth = e ;
    }
    
    EthernetInterface& getEth()
    {
        return eth;
    }
    
    void reconnect()
    {
        eth.connect();  // nothing I've tried actually works to reconnect 
    }
    
private:

    EthernetInterface eth;
    
};


#endif
