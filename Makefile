# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

GCC_BIN = 
PROJECT = Ethernet_Status_HelloWorld
OBJECTS = ./mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC/SVC_Table.o ./mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC/HAL_CM3.o ./EthernetInterface/lwip/core/mem.o ./EthernetInterface/lwip/core/tcp.o ./EthernetInterface/lwip/core/netif.o ./EthernetInterface/lwip/core/tcp_in.o ./EthernetInterface/lwip/core/dhcp.o ./EthernetInterface/lwip/core/memp.o ./EthernetInterface/lwip/core/tcp_out.o ./EthernetInterface/lwip/core/udp.o ./EthernetInterface/lwip/core/def.o ./EthernetInterface/lwip/core/stats.o ./EthernetInterface/lwip/core/dns.o ./EthernetInterface/lwip/core/raw.o ./EthernetInterface/lwip/core/timers.o ./EthernetInterface/lwip/core/pbuf.o ./EthernetInterface/lwip/core/init.o ./EthernetInterface/lwip/core/ipv4/igmp.o ./EthernetInterface/lwip/core/ipv4/ip_frag.o ./EthernetInterface/lwip/core/ipv4/autoip.o ./EthernetInterface/lwip/core/ipv4/inet.o ./EthernetInterface/lwip/core/ipv4/icmp.o ./EthernetInterface/lwip/core/ipv4/ip_addr.o ./EthernetInterface/lwip/core/ipv4/inet_chksum.o ./EthernetInterface/lwip/core/ipv4/ip.o ./EthernetInterface/lwip/core/snmp/msg_in.o ./EthernetInterface/lwip/core/snmp/asn1_enc.o ./EthernetInterface/lwip/core/snmp/mib_structs.o ./EthernetInterface/lwip/core/snmp/asn1_dec.o ./EthernetInterface/lwip/core/snmp/mib2.o ./EthernetInterface/lwip/core/snmp/msg_out.o ./EthernetInterface/lwip/api/netifapi.o ./EthernetInterface/lwip/api/sockets.o ./EthernetInterface/lwip/api/netbuf.o ./EthernetInterface/lwip/api/netdb.o ./EthernetInterface/lwip/api/api_lib.o ./EthernetInterface/lwip/api/err.o ./EthernetInterface/lwip/api/api_msg.o ./EthernetInterface/lwip/api/tcpip.o ./EthernetInterface/lwip/netif/etharp.o ./EthernetInterface/lwip/netif/slipif.o ./EthernetInterface/lwip/netif/ethernetif.o ./EthernetInterface/lwip/netif/ppp/auth.o ./EthernetInterface/lwip/netif/ppp/pap.o ./EthernetInterface/lwip/netif/ppp/randm.o ./EthernetInterface/lwip/netif/ppp/md5.o ./EthernetInterface/lwip/netif/ppp/lcp.o ./EthernetInterface/lwip/netif/ppp/magic.o ./EthernetInterface/lwip/netif/ppp/chap.o ./EthernetInterface/lwip/netif/ppp/ppp.o ./EthernetInterface/lwip/netif/ppp/ppp_oe.o ./EthernetInterface/lwip/netif/ppp/ipcp.o ./EthernetInterface/lwip/netif/ppp/vj.o ./EthernetInterface/lwip/netif/ppp/fsm.o ./EthernetInterface/lwip/netif/ppp/chpms.o ./EthernetInterface/lwip-sys/arch/sys_arch.o ./EthernetInterface/lwip-sys/arch/checksum.o ./EthernetInterface/lwip-sys/arch/memcpy.o ./EthernetInterface/lwip-eth/arch/TARGET_NXP/lpc17_emac.o ./EthernetInterface/lwip-eth/arch/TARGET_NXP/lpc_phy_dp83848.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Semaphore.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Event.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_List.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mutex.o ./mbed-rtos/rtx/TARGET_CORTEX_M/HAL_CM.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Task.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_CMSIS.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_System.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Time.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_MemBox.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Robin.o ./mbed-rtos/rtx/TARGET_CORTEX_M/RTX_Conf_CM.o ./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mailbox.o ./main.o ./EthernetInterface/EthernetInterface.o ./EthernetInterface/Socket/Endpoint.o ./EthernetInterface/Socket/TCPSocketServer.o ./EthernetInterface/Socket/UDPSocket.o ./EthernetInterface/Socket/Socket.o ./EthernetInterface/Socket/TCPSocketConnection.o ./HTTPClient/HTTPClient.o ./HTTPClient/data/HTTPFile.o ./HTTPClient/data/HTTPMap.o ./HTTPClient/data/HTTPText.o ./mbed-rtos/rtos/Thread.o ./mbed-rtos/rtos/Semaphore.o ./mbed-rtos/rtos/Mutex.o ./mbed-rtos/rtos/RtosTimer.o ./wakaama/liblwm2m.o ./wakaama/list.o ./wakaama/management.o ./wakaama/objects.o ./wakaama/object_server.o ./wakaama/observe.o ./wakaama/packet.o ./wakaama/registration.o ./wakaama/tlv.o ./wakaama/transaction.o ./wakaama/uri.o ./wakaama/utils.o ./wakaama/er-coap-13/er-coap-13.o ./wakaama/object_device.o ./wakaama/object_firmware.o ./SWUpdate/SWUpdate.o
SYS_OBJECTS = ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/retarget.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/system_LPC17xx.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/board.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/cmsis_nvic.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/startup_LPC17xx.o 
INCLUDE_PATHS = -I. -I./HTTPClient -I./HTTPClient/data -I./wakaama -I./EthernetInterface -I./EthernetInterface/Socket -I./EthernetInterface/lwip -I./EthernetInterface/lwip/core -I./EthernetInterface/lwip/core/ipv4 -I./EthernetInterface/lwip/core/snmp -I./EthernetInterface/lwip/api -I./EthernetInterface/lwip/netif -I./EthernetInterface/lwip/netif/ppp -I./EthernetInterface/lwip/include -I./EthernetInterface/lwip/include/ipv4 -I./EthernetInterface/lwip/include/ipv4/lwip -I./EthernetInterface/lwip/include/lwip -I./EthernetInterface/lwip/include/netif -I./EthernetInterface/lwip-sys -I./EthernetInterface/lwip-sys/arch -I./EthernetInterface/lwip-eth -I./EthernetInterface/lwip-eth/arch -I./EthernetInterface/lwip-eth/arch/TARGET_NXP -I./HTTPClient -I./HTTPClient/data -I./mbed-rtos -I./mbed-rtos/rtos -I./mbed-rtos/rtx -I./mbed-rtos/rtx/TARGET_CORTEX_M -I./mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3 -I./mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC -I./mbed -I./mbed/TARGET_LPC1768 -I./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM -I./mbed/TARGET_LPC1768/TARGET_NXP -I./mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X -I./mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768 -I./SWUpdate 
LIBRARY_PATHS = -L./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM 
LIBRARIES = -lmbed 
LINKER_SCRIPT = ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/LPC1768.ld

############################################################################### 
AS      = $(GCC_BIN)arm-none-eabi-as
CC      = $(GCC_BIN)arm-none-eabi-gcc
CPP     = $(GCC_BIN)arm-none-eabi-g++
LD      = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY = $(GCC_BIN)arm-none-eabi-objcopy

CPU = -mcpu=cortex-m3 -mthumb
CC_FLAGS = $(CPU) -c -g -fno-common -fmessage-length=0 -Wall -fno-exceptions -ffunction-sections -fdata-sections 
CC_FLAGS += -MMD -MP
CC_SYMBOLS = -DLWM2M_CLIENT_MODE -DTARGET_LPC1768 -DTARGET_M3 -DTARGET_NXP -DTARGET_LPC176X -DTARGET_MBED_LPC1768 -DTOOLCHAIN_GCC_ARM -DTOOLCHAIN_GCC -D__CORTEX_M3 -DARM_MATH_CM3 -DMBED_BUILD_TIMESTAMP=1410589802.46 -D__MBED__=1 

LD_FLAGS = -mcpu=cortex-m3 -mthumb -Wl,--gc-sections --specs=nano.specs -u _printf_float -u _scanf_float
LD_SYS_LIBS = -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys

ifeq ($(DEBUG), 1)
  CC_FLAGS += -DDEBUG -O0
else
  CC_FLAGS += -DNDEBUG -Os
endif

all: $(PROJECT).bin

clean:
	rm -f $(PROJECT).bin $(PROJECT).elf $(OBJECTS) $(DEPS)

.s.o:
	$(AS) $(CPU) -o $@ $<

.c.o:
	$(CC)  $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu99   $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 $(INCLUDE_PATHS) -o $@ $<


$(PROJECT).elf: $(OBJECTS) $(SYS_OBJECTS)
	$(LD) $(LD_FLAGS) -T$(LINKER_SCRIPT) $(LIBRARY_PATHS) -o $@ $^ $(LIBRARIES) $(LD_SYS_LIBS) $(LIBRARIES) $(LD_SYS_LIBS)

$(PROJECT).bin: $(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)
