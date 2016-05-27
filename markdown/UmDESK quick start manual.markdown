## Fairwaves UmDESK quick start manual

#####Contents:

#### 1.UmDESK
1.1 Mechanical / Electrical specification

1.2 Software specification

1.3 Hardware Options

1.4 Software variant

#### 2.	 Installation 

2.1 Getting started

2.2 Test call

2.3 Log in

2.4 IP and network configuration (optional) 

##1. UmDesk

![](http://s019.radikal.ru/i608/1409/60/3a29878257fd.png)

The UmDESK is an IP-backhaul GSM Network In The Box shaped in mini-ITX case which has the ability to work separately as BTS and BSC. As NITB, it includes BSC, MSC, HLR, VLR, and SMSC core network components.

#### 1.1 Mechanical / Electrical specification   

##### Enclosure	
- Dimensions: 130 x 220 x 330 mm  
- Weight: 3.8 kg

##### Environmental conditions       	
- Indoor  
- +10 to +30 °C operational temperature

##### RF Input/Output    	
- GSM 850/900/1800/1900   
- 2 independent TRX   
- Diversity receive     
- Multi-ARFCN on each TRX (beta)  
- Max output power per TRX: 100mW (850/900 bands), 50mW (1800/1900 bands)   
- 1W per channel (2x1W) with external boosters  
 
##### Reference Clock	
- GPS (default)  
- OCXO (optional)  

##### CPU
-  Intel Atom

##### Input Voltage and Power
- 110-220 VAC  
- Power consumption: less than 80W

##### Backhaul Interface
-  RJ45 Ethernet (100/1000Mbit)  

##### Antenna 
-  850/900/1800/1900 GSM frequency band compatible.

#### 1.2 Software specification

##### Number of Transceivers
- 2 TRX / 16 timeslots

##### Supported timeslot configurations
- CCCH, CCCH+SDCCH/4, SDCCH/8, TCH/F, TCH/H

#####Voice codecs
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
- Internal duplexer
- External cavity duplexer
- External 1W booster
- Clocking: OCXO / GPS disciplined

#### 1.4 Software variant

- BTS-only (variant of connection of the BTS to an external BSC)

![](http://s020.radikal.ru/i722/1409/54/841d04fe7f23.png)

- BSC  (BTS run as an internal instance of OpenBSC)

![](http://s013.radikal.ru/i323/1409/b0/18794da5f2b1.png)

- NITB (Fully autonomous GSM PBX with VoIP gateway (SIP interface))

![](http://i068.radikal.ru/1409/01/5150385cd640.png)

The difference between those variants is only in the installed and configured software packages on the Linux-based OS.  

## 2.	Installation 

UmDESK comes with already installed and configured software.

#### 2.1 Getting started   

1.	Connect to a power source, attach GSM antennas, monitor, and turn it on.

2. Check the LEDs on the front panel (TX1 RX1 TX2 RX2). if it lights up, UmDESK works properly 

3.	Make sure that the Ethernet cable is connected.
	

Take any GSM phone with any SIM card and try to search the network. Network might have a different names such as *Fairwaves, 1011, Test, etc*.
    
#### 2.2 Test call:
   
      
#### Searching for the Network

1. Launch the “Settings” from the menu system.

2. Select “More.”

3. Select “Mobile networks.”

4. Select “Network operators.” 

5. Select “Search networks.”

![](http://s61.radikal.ru/i171/1505/07/60f9ce0b5a97.png)



**Options:**  

 - 1002 - echo call (listen to yourself) 
     
- *#100# - to figure out the number that was assigned to your phone.  

 
### 2.3	Log in 

In order to configure and administer the UmDESK, you have to attach monitor or log in into device remotely over SSH. There are two physical ethernet interfaces.  External interface IP is **192.168.50.100** also it's configured to obtain IP address via DHCP. **192.168.10.10** is internal interface for the UmTRX.

###### Note: 

Small inch monitors might have a displaying problem with console mode resolution. 

just add

	blacklist gma500_gfx

line to

*/etc/modprobe.d/blacklist-framebuffer.conf*

in order to disable Linux Kernel Framebuffer for this graphics driver. 
______

Connect laptop to the UmDESK via Ethernet cable.

###### Note: 
Before startng to work with the device, set up IP address on laptop like this **192.168.50.200**  

1. Run PuTTY  
2. Type IP address: 192.168.50.100        
3. Login: fairwaves
4. Password: fairwaves
 
Once you have logged into the system, you will be at a Linux shell command prompt. 

You may use a deferent client software for remote access, we recommend **PuTTY** (you can download at [www.putty.org](www.putty.org "PuTTY") ).  PuTTY is an open source SSH and telnet client, for the Windows platform. 


#### 2.4	IP and network configuration (optional)
If you would like to set another static address for the device, edit 

 */etc/network/interfaces*  file:

	Shell> sudo nano /etc/network/interfaces

Refer to [**Ubuntu**](https://help.ubuntu.com/14.04/ubuntu-help/index.html) documentation for details  
