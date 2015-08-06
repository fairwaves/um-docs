
![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)

## FAQ

**Q:**
 What is included in the shipment?

**A:** 

1. Base station with already installed and configured software
2. Power supply
3. GPS antenna

___________________

**Q:**
How does installation without a GPS antenna affect the system?

 **A:** We strongly recommend using a GPS antenna; however, it is possible to work without it, but it may cause problems with cell phone registration to the network in terms of surrounding GSM networks, cell phone model, temperature. Once the phone has registered to a network, GPS does not affect the productivity of the system at all.
_____________

**Q:**
Does the units comes with the complete system to start working immediately?

**A:**
Yes, the system included Power supply and GPS anthenna. 
____________________

**Q:**
 How does the system handle handover between **MultiBTS** systems.

**A:** 
BSC is on a separate server. We use intra BSC handover. Setup is described at  **How to's**.
_______________
 
**Q:** How is roaming handled?

**A:** It depends on the type of core network
There are several options to implement and it is better to know your current situation and requirements.
______________

**Q:**
What is your radius coverage?

**A:**  
up to 200 m with 200mW (no external apmlifier)  
up to 1-2 km with 1W output power  
up to 10 km with 10W output power

**NOTE:** Please note, these figures are given as a reference. Coverage area will strongly depend on your local landscape and environment.

_________________
 
**Q:**
Do you have specific SIM-cards or can any SIM-cards be used?

**A:** Fairwaves base station could be configured to work with any SIM-cards. However, it is impossible to provide subscriber authentication and traffic encryption if you do not know Ki secret key of your SIM-cards. If you operate a normal mobile network with encryption and subscriber authentication, you can only set up an open network and either get SIM-cards with known Ki keys or set up a closed network. 

You can buy SIM-cards and program them.
______________________

**Q:** 
How do you handle SMS and GPRS in your systems? 

**A:**
Fairwaves base stations are able to provide basic services: Voice and SMS. Also, Fairwaves provide GPRS; in terms of quality it is disabled in production systems to get more capacity for the voice and SMS that is too slow to use it as data service. We are considering using WiFi instead of GPRS. 

_________________________

**Q:**  What is the capacity of the subscriber database?

**A:**
A base station with one transceiver is able to handle from 200 (if you offer your subscribers a flat tariff with free local calls) to 500 subscribers (normal mode with tariffs still comfortable for subscribers). For example, with 10,000 subscribers, you will need around 20 base stations. Please note this is a very rough estimation.
__________________


**Q:** Will the UMTRX work with UMTS?
Ho
**A:** UmTRX will work with UMTS, but we don't have a software implementation for that.
_____________________

**Q:** How do subscribers pay their bills in terms of village service?

**A:** 1. Express card payment; 2. Physically bring money to the person who has access to the enroll payments.
____________ 

**Q:** How does the subscriber provisioning process go, with SIM-cards or Phone?

**A:** SIM card. You can program your own SIM-cards and this would be a closed network. You can also use an existing SIM-card, then the network would be open.
_______________

**Q:** How is the billing system interconnected with MNO?

**A:** It depends on the architecture but in general: fairwaves billing system can be integrated with MNO through the camel and diametr protocol.
____________

**Q:**  Is it possible to connect external BTS to the network through A-bis interface?

**A:** We do not support external BTS connection through A-bis interface, because this architecture is not fault-tolerant from the connection lost. It does not have local call switching, and there is no simple way of backhaul optimization, which brings extra expenses for the village connection through the VSAT.
___________
**Q:** Do you have a stable branch/release set for UmTRX?

**A:** Yes, you can find this information at How to's chapter:
______

**Q:**
 Is it possible to collect a segment of independent OpenBTS and OsmoBTS under OpenBSC/SIP controller for the Handover modeling? 

**A:** 
Yes, you just need a two UmTRX
______________

**Q:**
How to connect through the ISUP/SIP-T as a MSC-MSC?

**A:** 
It doesn't implemented yet.
____
**Q:**
are the SGSN and GGSN implemented? 

**A:** 
Yes, osmo-sgsn and openggsn. This is not a complete implementation of SGSN and GGSN. For more information refer to [Osmocom](http://openbsc.osmocom.org/trac/wiki/OpenBSC_GPRS).
_____________

**Q:**
How to assign different external DIDs to different mobile phones?

**A:** 
Create multiple gateways and multiple rules in the dialplan. But we do not recommend that for this particular case. Usually people use SIP trunks, you need just routing appropriate calls to the trunk with a single rule.
______________

**Q:** Where is Osmocom connects to the SIP Server?

**A:** Osmo-nitb connects to LCR through the MNCC interface, LCR talk to SIP through FreeSWITCH 
_____

**Q:** TRX0 frequency spectrum detected but TRX1 does not seem to be transmitting on the specified frequency. what is could be the issue?

**A:**
According to the GSM Standard, only TRX0 has to transmit constantly.
Secondary TRX's can transmit only when TRX0 would completely loaded.

So if you want to see transmission on the TRX1 you should either:
1. have more than 6 active call legs (more than 3 acive calls), or
2. set TRX0 configuration to SDCCH and leave TCH only on the TRX1 and make a call.

In other case you'll see that the transmission on TRX1 is not
continuous, unless you have all TCH's on TRX1.
________


**Q:** Where is registration of mobile station on a SIP server, what kind of billing options available with UmSITE?

**A:** With the current UmSITE software, a VoIP server does not receive SIP INVITE messages for GSM users, so a BTS billing system can:
1. Enable/disable users in the GSM core using a socket API.
2. Route all calls to a SIP server or a SIP proxy for billing purposes.
3. Route all SMS to an SMPP server for billing purposes. 

[Here is an example of a system](https://github.com/Rhizomatica/rccn) that implements flat tariff plan for calls inside and per-minute for calls outside of the network.

We can help you do a non-standart configuration on demand and run a commercial network with more UmSITEs, in that case we suggest to discuss a commercial agreement to provide you support and network maintenance for upcharge price. 

______

**Q:** Will all calls be charged (inside/outside)?

**A:** It depends on whether you want to bill local calls or not.
_____

**Q:** Wouldn't providing free internal calls cause network congestion?
 
**A:** We're developing advanced options to avoid full network congestion in the UmCORE server, which will be available as part of the commercial agreement.

_____

**Q:** Do you have another option of commercial billing for inside and outside calls?

**A:** We can build a billing backend for you as part of the commercial agreement.
______

**Q:** How to control/change the process of automatical assigning a number? Where is the source code?

**A:** The code which generates the random number is [here](http://cgit.osmocom.org/openbsc/tree/openbsc/src/libmsc/db.c?h=fairwaves/master#n1229 ):

But we strongly recommend you not to modify the code. We regularly roll-out updated code and you'll be losing your changes.

The recommended way of assigning numbers is by out of band means:

1. You can create a simple web-portal for users to register at and claim their numbers.
2. Alternatively you can connect to OsmoNITB through SMPP and implement a special SMS number to claim numbers.
3. You can also intercept the first subscriber's call and play instruction how to claim the number.

______



**Q:** How to send the person a welcome Message with their assigned number?

**A:** Currently this is implemented only for the "token" authentication mode, but this mode it not recommended. It tried to kick users out of the network, which does not behave consistently for different phones. We would recommend to implement this through external means - e.g. by monitoring new user registrations on SMPP socket.

For the reference, code for the **token auth** located [here](http://cgit.osmocom.org/openbsc/tree/openbsc/src/libmsc/token_auth.c?h=fairwaves/master)
________

**Q:** How to route the SMS messages through an external gateway for two way messaging? 

**A:** SMS communication is implemented with SMPP 3.4 protocol. It's a standard for the SMS communication. OsmoNITB serves as an SMPP server. How to configure [SMPP](http://fairwaves.github.io/um-docs/soft_conf.html) (5.7 SMPP Configuration), so you should implement a client for these purposes. You can use [Kannel](http://www.kannel.org/) (Open Source WAP and SMS gateway)  or develop your own, there are SMPP bindings for C, Python and other languages.


_______________

**Q:** How to implement a GPS trackers connection to the UmDesk/UmSite through GPRS? 

**A:** We do not install GPRS on BTS, but this is available on stack that we are using [osmocom stack](http://osmocom.org/) 'How to' described [here](http://fairwaves.github.io/um-docs/how_to's.html)

For example:

If the GPS trackers and BTS would situated in 550 sq/ft room, then you will be able to use CS-4 coding scheme that allows up to ~ 20 kbit/s on gsm channel timeslot. Basically 2 TRx channels of UmDesk/UmSite with 15 timeslots for traffic provides up to 300 kbit/s. According to it, you can count how many trackers might work under one BTS.

