![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)

### Contents:

1. Fairwaves architecture
2. Deployment options
3. Componets 
4. Network for a one
5. Multiple networks
	* Master - slave
	
6. Integration with MNO
	* Roaming
	* Simcard
	* Billing
	* A-bis interface

7. Benefits
8. About Fairwaves

______

### Intro
Major GSM networks, as we know today, was designed primary for the urban locations in developed countries. General type of the network definitely non suitable to serve a rural area, because deployment requirements and cost is too expensive.

Why the rural populations living beyond the reach of traditional
communications networks of any kind? 

The rural consumer cannot pay the $50 per month like in USA or Europe. Fairwaves experience in Yaviche has shown that amount they will be  able to pay is around $2 - 3 per month. To better understand the problem, it doesn’t make economic sense to install the original GSM technology there and the challenge of Fairwaves company is not to only deliver a mobile service to rural users but also solve a fundamental business issue for mobile operators to turn rural coverage profitable. 




### 1. Fairwaves architecture

The Fairwaves network is made up of multiple components and interfaces that facilitate making call and sending messages inside of covered areas as well as outside. Networks could be isolated or interconnected with existed PLMN, PSTN as well as Private GSM Netwoks. This is a set of Base stations which include all GSM components and integrated with any other larger networks over VoIP as a BSC/BTS. Fairwaves solution can be used in rural and semi-rural locations.

### 2. Deployment options

The deployment options can be  combined into a single (Private) networks or as a extensions to any existing GSM network.

 - GSM networks for rural and semi-rural locations.
 - Private GSM networks (PBX style use)
 - Rapid deployment GSM networks
 - GSM related research and development

### 3. Componets

1. UmSITE (base station) Linux-based completely network in the box system, implement all GSM components such as BSC, BTS, MSC, VLR, HLR, SMSC. The software covers everything from power control to end user features.
2. UmCORE (server) node for data caching and billing integration between rural areas and MNO core network
3. Backhaul communications (Satellite/VSAT) for the remote connection with MNO core network

### Protocols

4. VoIP - flat IP architecture
5. SS7 - route calls to public switched telephone network (PSTN)


### 4. Network for a one 

**Let's take a look how the Fairwaves goes rural.**

![](http://s017.radikal.ru/i431/1411/16/c202f6073648.png)

Here is a village, covered by Fairwaves UmSITE base station. Base station provides up to 10 km radius coverege, it depends on the landscape. People who are living within the village area are able to call between each other locally without any other external connection.

### 5. Multiple network
Fairwaves connects two or more villages by using microwave radio transmission either long-distance Wi-Fi amplified router. 

![](http://s020.radikal.ru/i700/1411/03/a4833979a5cb.png)
_____
#### Master-slave

Sometimes a village has more people than one base station can handle (Usually that's fine for 500 subscribers). Fairwaves is installing a second Base station to increase total capacity  and set it up in slave mode. 

![](http://s018.radikal.ru/i503/1412/ba/7ca6993c3d42.png)


Independent UmSITEs can be clustered through a distributed HLR connected
via peer to peer links

First one become a master Base station which is connecting with the slave through the microwave. Master Base station implement all GSM components such as BSC, BTS, MSC, VLR, HLR, SMSC and Softswitch for the connection of telephone calls from one phone line to another, located remotely from rural areas across the public Internet through the VoIP protocol. Master Base Station connected with the colocated Fairwaves UmCORE Server and then with MNO Server through the VoIP/SS7 Gateway. 
Second Base Station(slave) implements only GSM component BTS for the increasing capacity and expanding coverage.  

Master responsible for: 

1. MSC (Mobile switching center)
2. Billing
3. Core network connection

Slave serves as:

1. Expanding coverage
2. Increase capacity


![](http://s16.radikal.ru/i191/1412/a1/8c1aa44b3c90.png)

_________________________
### 6. Integration with MNO

Fairwaves solution Can be integrated into existing core network through roaming protocols (MAP, CAMEL over SS7 or SIGTRAN)

Fairwaves provides a service to make a calls outside of local areas. The village gets access to the satellite Internet, all traffic goes directly to Mobile Network Operator (MNO) core network through the Fairwaves UmCORE server.

![](http://s017.radikal.ru/i426/1412/e7/ce2e6749af33.png)

_________________________ 
Fairwaves allows mobile operators to build independent networks with distributed VoIP cores, we are still responsible for the support for local routing of the calls and connection with MNO Core Network through the UmCORE server which is used for the Billing system integration between Fairwaves and Mobile operator software for the caching data as well as a HLR cache 

![](http://s005.radikal.ru/i209/1412/4e/883d0d867272.png)

**Fairwaves network required:**

 - License for one of the GSM bands: GSM-900, GSM-1800, GSM-850 or GSM-1900
 - Access to a power source, may be solar electricity.
 - Access to an IP backhaul, including VSAT, long-distance Wi-Fi, a microwave link, fixed WiMAX, or Ethernet.   

#### Roaming (Я думаю что мы должны избегать слово Roaming, только упомянуть его в тех-описании вскользь)

Roaming service is the ability to get access to the Network when you away from home location likes different countries, in our case between rural and urban locations.
Subscribers keep connected to the network while they traveling between village and MNO city. Fairwaves is a subnetwork of MNO core network and **logically** this is an entire infrastructure of Mobile operator but **technically** this is called roaming for our scenario and Fairwaves experience has shown that better way is providing sim cards and plan for rural subscribers separately than main plans. Most popular is fixed price for unlimited calls and text for the internal usage and per minute rate if they visit MNO core network location (roaming). 


#### Billing

All subscribers belong to Mobile operators and the payment terms still remains with the operators. Fairwaves only caching data of HLR, VLR and Billing, and provide service for rural areas. 

#### Simcard 

(без понятия! Может где то в тексте указать что возможен выпуск симок)

#### A-bis interface 

(это уж очень тонкий вопрос, как бы нас не восприняли как производители железа и не пасанули над сервисами. VNL писали про A-bis, не знаю на сколько это критично для нас. Интерфейсы расписать не проблема)


**Benefits:**

Technical:

 - Easy to install
 - Network failure tolerance 
 - Routing of local calls
 - Compatible with any GSM phone
 - Compatible with LTE core network
 - VoIP cloud core network
  
Economic:

 - Low-cost base station
 - Zero maintanance
 - Reduce traffic transfer costs by allowing local call routing
 - Low power consumption 

____



### About Fairwaves

Fairwaves provides GSM system that helps mobile operators reach rural markets and  turn it profitable.

UmSITE is a complete GSM system entirely optimized for rural markets.






