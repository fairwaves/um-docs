##Fairwaves UmSITE quick start manual

##### Contents:

#### 1. UmSITE

1.1 Mechanical specification

1.2 Software specification

1.3 Hardware Options


#### 2.	 Installation

2.1 Antennas installation
 
2.2 Getting started

2.3 Test call

2.4 Log in

2.5 IP and network configuration (optional) 

## 1. UmSITE

![](http://s017.radikal.ru/i406/1501/84/ef8c97c62e48.jpg)

The UmSITE is an IP-backhaul GSM BTS, BSC and Network In The Box.  This is tower-mounted, fault-tolerant and completely protected from any weather conditions solution, which is used for wide range network.



#### 1.1 Mechanical specification  

##### Enclosure  	
-  Dimensions: 465 x 190 x 170 mm  
-  Weight: less than 15 kg  

##### Environmental conditions  	
-  Outdoor
-  -30 °C to +45 °C operational temperature

##### RF Input/Output  	
- GSM 850/900/1800/1900 band  (chosen at order time)  
- 2 independent TRX  
- Diversity receive  
- Multi-ARFCN on each TRX (beta)  
- 10W per channel (2x10W)
- Real time power control via VTY  

##### Reference Clock	
- GPS (default)    
- OCXO (optional)    

##### CPU
- Intel Atom  

##### Input Voltage and Power
- 90 - 305 V AC   
- Power consumption: less than 100W  

##### Backhaul Interface
- RJ45 Ethernet (100/1000Mbit)  


##### Power supply
Fairwaves doesn’t provide the power supply. This is because, different places want to use different power sources. Fairwaves products compatible with any power sources including solar panels as well.	

####List of the power supply you may use:

UmSITE-TM10 (100W) ( IP65: [Mean Well HLG-100H-30A](http://www.onlinecomponents.com/mean-well-hlg100h30a.html?p=42885969)

UmSITE-TM3 (60~80W) IP65:  [Mean Well HLG-60H-15A](http://www.onlinecomponents.com/mean-well-hlg60h15a.html?p=43545144)

for the indoor purposes would fit a basic laptop charger like [this](http://www.amazon.com/Universal-Laptop-Notebook-Power-Adapter/dp/B00406ITIA/ref=sr_1_11?ie=UTF8&qid=1429815258&sr=8-11&keywords=laptop+charger) 


##### Antenna 
Faiwaves doesn’t provide an antenna. You can use any other antenna suitable for 850/900/1800/1900 GSM frequency band with N-male connectors.

#### 1.2 Software specification

##### Number of Transceivers
- 2 TRX / 16 timeslots

##### Supported timeslot configurations
- CCCH, CCCH+SDCCH/4, SDCCH/8, TCH/F, TCH/H

##### Voice codecs
- FR/HR/EFR/AMR; RTP stream

##### Ciphering
- A5/0, A5/1, A5/2 and A5/3

##### GPRS/EDGE
- GPRS - beta
- EDGE - planned

##### Operating System
Embedded Linux

##### Capacity
- maximum concurrent calls (Full/Half) Rate 15/30
- maximum simultaneous SMS 124 (15*SDCCH/8 + 1*SDCCH/4)

#### 1.3 Hardware Options
- Clocking: OCXO / GPS disciplined


## 2.	Installation 

Base station comes with already installed and configured software, just attach GPS antenna, GSM antennas and power supply.

**Steps**

1. Place the UmSite on the mast directly connectors down
2. Attach GSM antennas. We recommend having at least 10 ft (3m) between them
3. Attach GPS antenna. Good antenna visibility to the sky is required
4. Turn on Base station

**Note:** GSM antennas are not included in a standard package. We do not recomend to operate base station without antennas

#### 2.1 Antennas installation

Each of both antennas complement each other. The second antenna must have the same position as the first antenna on a mast as well as the same direction and incline angle to the ground. 

For the GPS antenna, there are no strict requirements only good antenna visibility to the sky


![](http://s019.radikal.ru/i618/1507/f7/780db1eb7edf.png)

---------

For the mast at least of 100 ft (30m) in height, antennas can be mounted upright within the 10 ft (3m) distance between each other.

![](http://s50.radikal.ru/i130/1507/7a/eb8b60961081.png)

**NOTE:** Every cell is configured with a [BCCH](https://en.wikipedia.org/wiki/Broadcast_control_channel) carrier. 
Generally, the TRX ID of BCCH is fixed to be the smallest TRX ID in the cell.


Therefore TRX1 antenna  has to be situated below TRx2 antenna e.g. If the connection would be established when the TRx1 antenna is higher and then has assigned to a timeslot of the lower antenna TRX2, call connection could be lost.  

*The antenna attached to the TRX1 should not have an advantage by height in that particular case.*

#### 2.2	Getting started   

1.	Connect to power source and turn it on. LED on the front pannel will flashing in 1-2 minutes later turned on.
  
2.	Make sure that Ethernet cable connected.

**Note:** We strongly recommend does not put UmSITE on a public network. Connect it to your local network where is access to Internet through NAT or Firewall. Keep UDP port 1195 open on your server for fairwaves VPN in case technical support

![](http://s019.radikal.ru/i633/1505/04/7e1b573f0b89.png)


Take any GSM phone with any SIM card and try to search the network. Network might have a different names such as *Fairwaves, 1011, Test, etc*.
    
#### 2.3 Test call:
   
      
#### Searching for the Network

1. Launch the “Settings” from the menu system.

2. Select “More.”

3. Select “Mobile networks.”

4. Select “Network operators.” 

5. Select “Search networks.”

![](http://s61.radikal.ru/i171/1505/07/60f9ce0b5a97.png)



**Options:**  

 - 1002 - echo call (listen yourself) 
     
- *#100# - to figure out the number that was assigned to your phone.  


 
#### 2.4	Log in 

In order to configure **UmSITE**, you have to login into device remotely over SSH. Interface configured to obtain IP address via DHCP and also static **192.168.50.100**

Connect laptop to the UmSITE via Ethernet cable.

###### Note: 
Before startng to work with the device, set up IP address on laptop like **192.168.50.200**  

1. Run PuTTY  
2. Type IP address: **192.168.50.100**        
3. Login: fairwaves
4. Password: fairwaves
 
Once you logged in, you will get access to Linux terminal.

You may use a deferent client software for remote access, but we recommend **PuTTY** (you can download at [www.putty.org](www.putty.org "PuTTY") ).  PuTTY is an open source SSH and telnet client, for the Windows platform. 

##### Login over Serial cable

Serial connection allows  you to look over the system on the booting level.

You'll get options like:


1. Advanced options for Ubuntu
2. Test RAM memory

![](http://s017.radikal.ru/i443/1503/23/6b5a8596dac4.jpg)

First of all you have to use **USB Serial Adapter** for the connection (which is not included in a standard UmSITE package).

![](http://s017.radikal.ru/i422/1505/62/53fa6e8aaad9.jpg)

For the Windows user [**putty**](www.putty.org "PuTTY") 

![](http://s017.radikal.ru/i413/1503/ad/0b02ea2dc90f.png)

Number of the COM port available at **Desktop manager** when you are connecting to the laptop. 


For the Linux user **[minicom](http://www.cyberciti.biz/tips/connect-soekris-single-board-computer-using-minicom.html)**

Run the command to connect via serial cable:

	shell> minicom -D/dev/ttyUSB0 -b38400 -o 



#### 2.5	IP and network configuration (optional)

If you would like to set another static address for the device, edit 

 */etc/network/*interfaces  file:

	Shell> sudo nano /etc/network/interfaces

Refer to Ubuntu documentation [**UBUNTU**](www.help.ubuntu.com/14.04/serverguide/network-configuration.html) for details  

**Note:** Base station configured to get IP address through DHCP. 
We also recommend to keep configuration for the **eth1:1** 
(192.168.50.50/24), because it's used as a backup IP address. If you
want to configure a statis IP address, change **eth1** configuration.
____________


