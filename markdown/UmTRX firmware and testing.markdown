![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)

## UmTRX. Firmware and testing (Fairwaves version)

###Contents:

##### 1.  Preparing PC/Laptop 
##### 2.  Installing firmware (automatically)
##### 3.  Testing UmTRX
##### 4.  Installing firmware (manually)
##### 5.  UmTRX scripts
##### 6.  Set a 2nd TxRX channel for the calls of UmTRX 2.2 (optional)
##### 7.  EEPROM   
##### 8.  GPS testing

### 1. Preparing PC/Laptop 
Firt of all you have to install UHD Driver on your 1st and 2nd PC/Laptop: [UHD-Fairwaves](https://github.com/fairwaves/UHD-Fairwaves) We going to use 2nd PC/Laptop at the testing step.

 - **umtrx** branch  - 003.004 (old version UHD)   
 - **umtrx_update** branch  - 003.008 (new version of UHD)

**NOTE:** Old vesion of UHD working only with the old firmware as a new one with the new.

Here is the instruction how to install a 003.004 version

Clone and build  

		git clone https://github.com/fairwaves/UHD-Fairwaves.git
		cd UHD-Fairwaves/host
		mkdir -p build
		cd build
		cmake ../
		make -j4
		make test
		sudo make install
		sudo ldconfig

Before starting to work with UmTRX you should download this utility
[xc3sprog](http://xc3sprog.sourceforge.net/guide.php ) on the 1st PC/Laptop

Run:
 
		shell> svn co https://xc3sprog.svn.sourceforge.net/svnroot/xc3sprog/trunk xc3sprog

then:

	cd xc3sprog
	cmake .
	make
	make install

### 2.  Installing firmware (automatically)

**1.** Plug the cables to the UmTRX board

![](http://s020.radikal.ru/i712/1411/6c/5d94fbd5f9f1.jpg)

make shure you pull the switch down

![](http://s017.radikal.ru/i406/1411/93/21805c64d9a2.png)

**2.** Download firmware and utils here:

**3.** Now go to **umtrx** directory on your PC which contains all files and utils for the firmware UmTRX board:

![](http://s017.radikal.ru/i433/1411/7a/f16487835048.jpg)

and run **tester.py**


	shell> ./tester.py


![](http://s017.radikal.ru/i441/1411/52/d07003dce853.png)


**4.** Choose version of the firmware by the checking or not 4xDDC square: 


 - if **YES**: You will setup cut version which is used just for the signal receive 

 - if **NO**: You will setup fully functionally firmware


**5.** Set the serial number and press start.

*Baseline* -- **BB001** (**B**=Baseline (fixed), **B**=Batch series (can change), **001**=UmTRX number. increment by 1) 

*Tx* -- **XA001** (**X**=Tx (fixed), **A**=Batch series (can change), **001**=UmTRX number. increment by 1)

**Note:** Serial number should be marked on the board itself by marker and match with the number you've typed

![](http://s50.radikal.ru/i127/1411/4f/808bf5326462.jpg)

### 3.  Testing UmTRX

For the testing receiving part, you need device called signal hound tracking generator or another fully functional UmTRX with PC/Laptop.  

**NOTE:** Before start testing receiving part of the UmTRX you have to install  [GNU Radio 3.6.5.1](http://gnuradio.org/redmine/projects/gnuradio/files) from the source on the 1st PC/Laptop(tested). [Build guide](http://gnuradio.org/redmine/projects/gnuradio/wiki/BuildGuide)

**We're going to owerview a method with UmTRX.**


**1.** Connect UmTRX with already firmware  directly to 2nd PC/Laptot (UHD driver has to be installed as well) and attach the antenna to tx1 of TRX1.

- go to: 

		shell> cd /usr/local/lib/uhd/examples/

**NOTE:** If you can't find that directory, just run: 

		shell> locate uhd/examples

 - run command for the frequency streaming.


		shell> ./tx_waveforms --rate 1083333 --freq 857e6 --wave-type SINE --wave-freq 1e3

**NOTE:** We set 857Mhz frequency, that means, parameter should be the same on the receiving side. 


**2.** Connect the tested UmTRX directly to the 1st PC/Laptop, attach antenna on the receiver spot

![](http://s57.radikal.ru/i157/1411/ee/0483845891fd.jpg)

![](http://s019.radikal.ru/i625/1411/9b/74c8c26cc810.jpg)

 and run command for the **Rx1** :

	sudo uhd_fft -f 857M -s 3.25M --spec A:0

Change the antenna cpot for the **Rx2** and run:


	sudo uhd_fft -f 857M -s 3.25M --spec B:0

If the receiver works properly, you will see the waves like on the picture below

![](http://s013.radikal.ru/i323/1411/be/238efddcff7a.jpg)

### 4. Installing firmware manually 

1. If you would like to load firmware manually, here is a detailed instruction how to:  **[umtrx.org](http://umtrx.org/hardware/flashing/)**


2. If you would like to overwrite the firmware, just follow this steps:

 - Firt of all you should load **[safe mode](http://umtrx.org/hardware/booting/#safemode)** (push safe button and wait for LEDs D and F to light constantly and release “Safe”):

			sudo umtrx_net_burner --addr=192.168.10.2 --fpga=u2plus_umtrx_v2.bin --fw=umtrx_txrx_uhd.bin --overwrite-safe

 - and then:

			sudo umtrx_net_burner --addr=192.168.10.2 --fpga=u2plus_umtrx_v2.bin --fw=umtrx_txrx_uhd.bin

### 5. UmTRX Scripts

	git clone https://github.com/fairwaves/umtrx_scripts.git

Scripts for UmTRX control, including LMS6002D control library.


### 6.  Set a 2nd TxRx channel for the calls of UmTRX 2.2 (optional)

If you would like test a calls through the second TxRX channel only, you should change config file: 

*/etc/osmocom/openbsc.cfg*

You have to replace parameters TCH/F on SDCCH8 over all timeslots of TRx0 (first channel)
 

**Example:**

	trx 0
	rf_locked 0
	arfcn 74
	nominal power 23
	max_power_red 0
	rsl e1 tei 0
	timeslot 0
	phys_chan_config CCCH+SDCCH4
	timeslot 1
	phys_chan_config SDCCH8
	timeslot 2
	phys_chan_config SDCCH8
	timeslot 3
	phys_chan_config SDCCH8
	timeslot 4
	phys_chan_config SDCCH8
	timeslot 5
	phys_chan_config SDCCH8
	timeslot 6
	phys_chan_config SDCCH8
	timeslot 7
	phys_chan_config SDCCH8
	trx 1
	rf_locked 0
	arfcn 84
	nominal power 23
	max_power_red 0
	rsl e1 tei 0
	timeslot 0
	phys_chan_config TCH/F
	timeslot 1
	phys_chan_config TCH/F
	timeslot 2
	phys_chan_config TCH/F
	timeslot 3
	phys_chan_config TCH/F
	timeslot 4
	phys_chan_config TCH/F
	timeslot 5
	phys_chan_config TCH/F
	timeslot 6
	phys_chan_config TCH/F
	timeslot 7
	phys_chan_config TCH/F



### 7. EEPROM

Here is the value by default [UHD-Fairwaves](https://github.com/fairwaves/UHD-Fairwaves/blob/eb69bb2a78bc4cbe63394b0b25057299832291c3/host/umtrx_eeprom.cpp#L53)


###### Set value

Use **master** branch at: 

	UHD-Fairwaves/host/utils/



Run to set the value:

	./usrp_burn_mb_eeprom --key <key> --val <val>

**Note:** all values should be stored in decimal format

### 8. GPS testing

1. Attach GPS antenna. Good visibility to the sky is required
2. Make sure that G LED is lit right after power on
3. During 3-5 min G LED should start blinking
4. Check TCXO DAC value. The value should decrease constantly. Default: 2048  

*First clone the umtrx_scripts repository:* 

	$ git clone https://github.com/fairwaves/umtrx_scripts

run:

	./python_lib/umtrx_vcxo.py

5.Retrieving raw NMEA data from the GPS module


	$ echo . | nc -u 192.168.10.2 49171

