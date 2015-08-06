
![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)


### How to's 


#### Contents:

1. Fairwaves Branch, release set
2. UmTRX firmware
3. Firmware upgrade 
3. UHD Driver 
4. Osmo-TRX rebuild (optioanl)
5. How Freeswitch connects to LCR
6. How to set up a MultiBTS
7. Handover
8. How to change unit ID
9. How to get GPRS up and running with the UmTRX board
10. UmTRX 2.2 box STL file
11. UmDESK displaying problem
12. How to disable a second TRx
13. How to set TRx output power

### Stable branch release set for UmTRX

	Source            Branch

1. [UHD-Fairwaves](https://github.com/fairwaves/UHD-Fairwaves.git) (master)
2. [Osmo-trx](http://git.osmocom.org/osmo-trx) (fairwaves/master)
3.  [libosmocore](http://git.osmocom.org/libosmocore ) (fairwaves/master)
4.  [libosmo-abis](http://git.osmocom.org/libosmo-abis ) (fairwaves/master)
5.  [openBSC](http://git.osmocom.org/openbsc ) (fairwaves/master)
6.  [osmoBTS](http://git.osmocom.org/osmo-bts ) (fairwaves/master)


### UmTRX firmware  

If you are presently using an older UmTRX-specific fork of the main UHD codebase (UHD version 003.004) and would like to be up and running with the new driver (for UHD version 003.008 and later), you must first upgrade the firmware on your UmTRX. 

in this order:

1. Use the old monolithic driver to upgrade both the production and safe firmware
2. Reboot the UmTRX
3. Remove the old UHD fork
4. Install latest UHD from ettus and UmTRX module


**Warning:** *moving to the new driver first and then attempting to upgrade the firmware may brick your UmTRX!*
 
1.Install old monolithic Fairwaves [UHD](https://github.com/fairwaves/UHD-Fairwaves/tree/fairwaves/umtrx/host) (branch* *old_master*)

### Firmware Upgrade 

Binary firmware releases can also be found in the GitHub repo, in the [images directory](https://github.com/fairwaves/UHD-Fairwaves/tree/master/images).
 

A utility provided by [UHD-Fairwaves](https://github.com/fairwaves/UHD-Fairwaves/tree/master/host/utils).

Provided that everything downloaded without any issues you can now proceed with updating. You must ensure that the power source and Ethernet connection with the UmTRX is stable during these operations!


	$ ./umtrx_net_burner.py ‐‐addr=192.168.10.2 ‐‐fw=umtrx_txrx_uhd.bin ‐‐erase
	$ ./umtrx_net_burner.py ‐‐addr=192.168.10.2 ‐‐fpga=u2plus_umtrx_v2.bin
	$ ./umtrx_net_burner.py ‐‐addr=192.168.10.2 ‐‐fpga=u2plus_umtrx_v2.bin ‐‐overwrite-safe
	$ ./umtrx_net_burner.py ‐‐addr=192.168.10.2 ‐‐fw=umtrx_txrx_uhd.bin


detailed instruction how to:  **[umtrx.org](http://umtrx.org/hardware/flashing/)**

2.Reboot (power up/down) UmTRX for the final step of firmware loading

3.Remove old UHD (003.004)
 
 
		aptitude purge libuhd-dev libuhd003 uhd uhd-host

4.Install latest UHD from ettus and UmTRX module. 

Follow the steps below described in UHD installation chapter.

Run: 

		uhd_usrp_probe 

to verify that correct version of uhd is installed and UmTRX with the new firmware detected properly.

**Summary:** 

##### old UHD -> new firmware -> new UHD

### UHD Driver

A host driver is provided by UHD plus a loadable module that adds UmTRX support.

If you already have a reasonably recent UHD install that was built with module support, you may only need to build and install the UmTRX module. However, at the time of writing the binary downloads from Ettus were built without this option enabled. See below for details.

We provide instructions for Linux users only, but the driver should work under Windows and MacOS X as well.

##### Installation

UmTRX driver is a loadable module for the UHD library, so the main UHD library is required for the UmTRX driver to operate. Loading UmTRX driver allows any of the myriad of UHD applications to work with UmTRX just like with any other UHD compatible device. Below we describe how to install the UHD library and UmTRX module for it.

The UHD version supported by the current UmTRX driver is 003.008.

**NOTE:** *The binary downloads from Ettus have module support disabled and doesn’t work with UmTRX.*

If you’re an Ubuntu user, you can download UHD library built with loadable modules support from [Josh Blum’s PPA:](https://launchpad.net/~guruofquality/+archive/ubuntu/pothos/+packages)

	$ sudo apt-get install python-software-properties
	$ sudo add-apt-repository ppa:guruofquality/pothos

##### Building form source

For UHD build and installation details see the [UHD Wiki](http://code.ettus.com/redmine/ettus/projects/uhd/wiki/UHD_Build).

##### UmTRX module

Once UHD has been installed the **UmTRX module** must be built and installed.

Go to *master* branch of the UHD-Fairwaves repository,


	$ git clone https://github.com/fairwaves/UHD-Fairwaves.git
	$ cd UHD-Fairwaves/host
	$ mkdir build
	$ cd build
	$ cmake ../
	$ make
	$ sudo make install

**Note** that if build fails with a boost-related error, a more recent version of this may need to be installed.



### Osmo-TRX rebuild  

**Note:** This is required, If you have already installed Osmocom software before you update UHD.

After the UHD update for 003.008, Osmo-TRX doesn't work! In terms of the new UHD version, an Osmo-TRX rebuild is required.

go to:

*/fairwaves-tools/deps/osmo-trx*

and run

	./autoreconf -fi
	configure
	make -j4
	sudo make install

### How Freeswitch connects to LCR 

Freeswitch talk to LCR through the SIP protocol 

path: *etc/lcr/interface.conf*

**Freeswitch IP**

	<remote ip>[:<remote port>] 

**LCR IP**

	<local ip>[:<local port>]  


### How to set up a MultiBTS

Network architecture looks like that:

 - **BSC**: osmo-nitb 172.30.1.10
 - **BTS1**: osmo-bts-1 172.30.1.11
 - **BTS2**: osmo-bts-2 172.30.1.12

**BTS1 and BTS2 configuration**

There are two parameters which should be set correctly in BTS configuration:

 - **ipa unit-id** - each BTS should have unique ipa unit-id
 - **oml remote-ip** - BSC ip address


**BSC configuration**

There are three parameters which should be checked in BSC configuration:

 - **ip.access unit_id** - you should set the same unit id in the BSC as well as in BTS, each BTS should have unique ipa unit-id
 - **base_station_id_code** - should be unique in location area
 - **neighbor-list** mode automatic

### Handover 

Handover is the ability to keep connection an ongoing call between two base stations.

 - you should use **MultiBTS mode** for osmo-nitb and osmo-bts
 - enable handover in osmo-nitb configuration *etc/osmocom/openbsc.cfg*

		 handover 1
		 handover window rxlev averaging 10
		 handover window rxqual averaging 1
		 handover window rxlev neighbor averaging 10
		 handover power budget interval 6
		 handover power budget hysteresis 3
		 handover maximum distance 9999


### Parameters

	handover (0|1)

Enable BSC in-call handover between multiple BTS

	handover window rxlev averaging <1-10>

Over how many SACCH frames should the Rx Level of the serving cell be averaged?

	handover window rxqual averaging <1-10>

Over how many SACCH frames should the Rx Quality of the serving cell be averaged?

	handover window rxlev neighbor averaging <1-10>

Over how many SACCH frames should the Rx Level of a neighbor cell be averaged?

	handover power budget interval <1-99>

Every how many SACCH frames should the BSC think about performing a power budget (rx level) handover?

	handover power budget hysteresis <0-999>

How large should the hysteresis be, i.e. to prevent continuous handover back and forth

	handover maximum distance <0-9999>

What is the maximum distance from a BTS, after which we try to perform distance handover?

**Note: ** Handover configuration available through the VTY command line, see [software configuration manual](https://fairwaves.co/docs/soft_conf.html)

### How to change unit ID 

Find the `ipa unit-id <new-UNIT-ID> 0` line in `osmo-bts.cfg ` file. Change only this value `<new-UNIT-ID>` 

**NOTE:** `ipaccess-config` utility doesn't work with OsmoBTS/OpenBSC/UmTRX. It only works with ip-access hardware. Do not use it.



### How to get GPRS up and running with the UmTRX board 

[osmo-pcu](http://openbsc.osmocom.org/trac/wiki/osmo-pcu) has to be installed:


	git clone git://git.osmocom.org/osmo-pcu
	cd osmo-pcu/
	autoreconf -i
	./configure
	make
	cd ..

GPRS configuration can be configured through the VTY telnet interface. Refer to [osmocom](http://openbsc.osmocom.org/trac/wiki/osmo-nitb_VTY#gprsmodenonegprsegprs) for details

### UmTRX 2.2 Box STL file

Here is the 3D box model for the UmTRX 2.2 

[Google disk](https://drive.google.com/file/d/0B3xPODI_0rbmamM3b0JpYnhKT0E/view?usp=sharing)

[OnShape](https://cad.onshape.com/documents/edb24e899c054f1fba13e4f7/w/44b26294dc3e4644871fb306/e/97db57be8e74499b820e58ec) 

### UmDESK displaying problem

Small inch monitors might have a displaying problem with a console mode resolution. 

in order to disable Linux Kernel Framebuffer for this graphics driver 

just add

	blacklist gma500_gfx

line to

*/etc/modprobe.d/blacklist-framebuffer.conf*

### How to disable a second TRx

In order to disable a second channel follow these steps bellow: 

1.Remove **TRx 1** configuration in */etc/osmocom/openbsc.cfg*


	
		trx 1
		 rf_locked 0
		 arfcn 20
		 nominal power 23
		 max_power_red 0
		 rsl e1 tei 0
	    timeslot 0
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 1
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 2
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 3
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 4
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 5
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 6
	     phys_chan_config TCH/F
	     hopping enabled 0
	    timeslot 7
	     phys_chan_config TCH/F


also remove 

	trx 1
	  rxgain 12
	  power 0

in *etc/osmocom/osmo-bts.cfg*

2.change value **-c 2**  on **-c 1** in */etc/sv/osmo-bts/run*
  
and **-t 2** on **-t 1** in */etc/sv/osmo-trx/run*

3.restart services

	sudo sv restart osmo-bts osmo-trx osmo-nitb


### How to set TRx output power

Runtime output power control is not implemented yet, but you can set the default output power through the EEPROM

Write into UmTRX EEPROM correct value "**dcdc_r**"


 - dcdc_r=0 about 1W of output power. 
 - dcdc_r=188 about 3W of output power. 

Values between 0 and 188 will gradually change output power.

Use 

	usrp_burn_mb_eeprom 

standart utility from Ettus UHD, default path:

*/usr/local/lib/uhd/utils/*

If this path does not match with your system, run  

	locate usrp_burn_mb_eeprom 

to find it either way clone  [UHD-Fairwaves](https://github.com/fairwaves/UHD-Fairwaves/tree/old_master/host/utils)


To set **dcdc_r** in EEPROM:

	usrp_burn_mb_eeprom --values "pa_dcdc_r=0"

To check the current EEPROM value:

	usrp_burn_mb_eeprom --values "pa_dcdc_r"

To overwrite EEPROM value you can set the environment variable for osmo-trx:

	$ UMTRX_PA_DCDC_R=0 osmo-trx -c 2 -s 4

osmo-trx start script is located in */etc/sv/osmo-trx/run*

**NOTE:** Real time output power control is available, see instruction  5.5 BTS Configuration of  [software configuration manual](https://fairwaves.co/docs/soft_conf.html) 






