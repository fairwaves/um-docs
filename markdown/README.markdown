Hacker's guide to UmDESK
========================

**TODO: Point to (not yet written) user friendly docs for web-based system.**

Introduction
------------

Fairwaves is a unique company. Every piece of UmDESK technology is completely open source. From top to bottom. From software to hardware. If you want, you can tinker with every part of it. Of course, it doesn't mean you *need* to roll up your sleeves and open the box on every problem. UmDESK works great out of the box (if it's not please let us know: we would love to fix it!). But there are many cases where you would want to dive into our technology:

* Simple curousity. We were all kids, many of us loved to break into toys.
* The need to fix or improve things *right now*. We would love to implement every single feature our customers want, instantly. Alas it's impossible.
* You may want to create something new based on our technology.

If you are old enough you may remember repair manual for electronics:

<img src="http://cl.ly/image/1K1v2M2p1z3I/Image%202014.08.01%203%3A52%3A04.png" height="350px" alt="old manual example">

Wasn't it awesome? Unfortunately, in the modern times this awesomeness is getting lost. Nowadays you buy a shiny piece of electronics that works wonderfully… until it breaks. Then you either throw it away and buy a new shiny thing, or you go to the manufacturer, because they are the only ones who knows how to fix it.

At Fairwaves we believe the status quo is broken. We don't want to sell you the equipment that is closed. We engineers hate when our fellow engineers can't open UmDESK and meaningfully tinker with it.

Quick start
-----------

Before diving into UmDESK techology and its history, let's get a feeling of what UmDESK can do. Simplified, UmDESK is a computer and a radio board, UmTRX:

                                                       \ | /
                                                        \|/
                   |----------|  Ethernet  |-------|     |
    Internet <---->| computer | <--------> | UmTRX |-----|
                   |----------|            |-------|


Computer runs [Ubuntu](http://ubuntu.com). You can log into it via SSH or - in some UmDESK variants - by attaching a keyboard and a monitor. Default username *and* password is `fairwaves`.

(Very-very quick and shallow pointers for changing stuff.)

UmTRX
-----

At the heart of UmDESK is a [software-defined radio][sdr] (SDR) board called UmTRX. UmTRX is a descendant from Ettus Research USRP board. USRP is a great board and Ettus deserves huge kudos for producing and open sourcing it. We still use UHD driver for UmTRX, for example. Why make our own? The short answer is that UmTRX was made specifically for GSM. E.g. two channels for practical voice capacity, following strict GSM standards. Like USRP, UmTRX is an open source hardware. But unlike Ettus we don't try to hide anything. Everything is open source:

* schematics,
* circuit board layout,
* FPGA bitstream and
* ZPU microcontroller firmware.

Ettus would be on the same board, if it would open source circuit board layout (which it doesn't do).

You can learn more about UmTRX on [umtrx.org](http://umtrx.org).

[sdr]: http://en.wikipedia.org/wiki/Software-defined_radio

Software architecture
---------------------

What is going inside the computer? Inside we have standard Ubuntu, UmTRX drivers (UHD), GSM and telephony implementation. Here's how it looks like:

```
              +                                                                 
              |                                                                 
              +-----+                                                         
 \       /    | GSM |                                                         
  \  |  /     |phone|                                                         
   \ | /      |     |                                                         
     |        |     |                                                         
     |        +-----+                                                         
     |                                                                          
+------------+                                                                  
| UmTRX (SDR)|                                                    +------------+
+------------+                   +--------------------------+     | FreeSWITCH |
     |                           | OpenBSC (OsmoNITB mode)  |     +------------+
     |1Gb                        |                          |          |        
     |Ethernet                   | +-----+ +-----+ +------+ |          |SIP     
     |                           | | BSC | | MSC | | SMSC | |          |        
+---------+   +---------+  Abis  | +-----+ +-----+ +------+ |  MNCC  +-----+    
| OsmoTRX |---| OsmoBTS |--------| +-----+ +-----+ +------+ |--------| LCR |    
|         |   |         |        | | HLR | | VLR | | AuC  | |        +-----+    
+---------+   +---------+        | +-----+ +-----+ +------+ |                   
                                 +--------------------------+                   
transceiver   base station        controller and core network                   
```

FreeSWITCH and LCR are about the telephony, everything between them and UmTRX is Osmocom GSM stack.

Osmocom GSM
-----------

UmTRX is cool, but it can't work on its own. It requires computer and a software to do anything useful.  At the heart of it is Osmocom GSM stack.

Before describing what Osmocom stack consists of, a few words about GSM terminology. In order to build a working GSM network you need a couple of things:

0. TRX, transceiver
1. BTS, base tranceiver station
2. BSC, base station controller
3. MSC, mobile switching center
4. VLR and HLR, (mostly) subscriber database

People behind Osmocom project first started hacking on GSM with the goal to implement an open source BSC. There was a client who already had a couple of ipaccess BTSes and an MSC. What was needed was BSC and it appeared to be less expensive to write a new BSC implementation than to buy existing BSC on the market. So OpenBSC project was born. You can tell it was here at first, because it's the only Osmocom project without "Osmo" prefix.

After OpenBSC other missing parts of GSM stack were implemented:

* OsmoBTS and OsmoTRX, to replace ipaccess BTS. You can tell OsmoBTS is ipaccess-compatible by looking at its config.
* OsmoNITB (network-in-the-box), OpenBSC mode that provides MSC, VLR and HLR functionality.

You may have heard about OpenBTS project before. Remember, OpenBTS has *nothing* to do with Osmocom GSM. Unfortunately names are similar (compare OpenBSC with OpenBTS), but they have nearly nothing in common. OpenBTS is monolitic GSM-to-VoIP bridge, while Osmocom provides classic modular GSM implementation. And - most importantly - Osmocom stack works much better and much more reliable than OpenBTS. Trust us, we've tried.

HOWTOs
------

### How to start

* Unwrap UmDESK and take a look at it.
* Make sure Ethernet cable connects UmTRX to Ethernet port on UmDESK motherboard (as opposed to external Ethernet PCI card).
* Connect UmDESK to power source and turn it on. At this point you can test if it works by taking any GSM phone with any SIM card and trying to connect to a new network. The new network can have different names - Fairwaves, 1 01, Test, etc.
* Dial test numbers to check the voice service: `1001` to listen to some music, `1002` to listen to yourself (echo).
* Dial `*#100#` to figure the number that was assigned to your phone.
* Connect another phone in the same manner and check if you can initiate calls and messages between the two phones.

Now you may want to change some parameters. You can do it by changing config files on UmDESK. But first you need to log in.

### How to connect antennas

TODO GSM and GPS antennas

### How to log in

* External Ethernet card is configured to get IP address via DHCP, and also has a fixed `192.168.50.100` address. E.g., you can connect UmDESK via Ethernet cable to your laptop and configure the laptop to use `192.168.50.200` address.
* Use SSH client to connect to the box. OSX and Linux usually have SSH client already installed: `ssh fairwaves@192.168.50.100` (default password is also `fairwaves`). If on Windows, install and use PuTTY.

### How to change IP network configuration

**(this is optional)**

If you need to configure static IP address, edit `/etc/network/interfaces` file:

```
sudo nano /etc/network/interfaces
```

Refer to [Ubuntu documentation](https://help.ubuntu.com/14.04/serverguide/network-configuration.html) for details.

### How to change GSM parameters

To change GSM parameters, edit `openbsc.cfg`:

* `sudo nano /etc/osmocom/openbsc.cfg`

The most important parameters are:

* network code
* country code
* short name
* long name
* auth policy (it's open for all by default)
* mobile network code
* band
* trx 0 [arfcn][]
* trx 1 arfcn

[arfcn]: http://en.wikipedia.org/wiki/Absolute_radio-frequency_channel_number

(There's also `/etc/osmocom/osmo-bts.cfg`, but it's less frequently changed.)

After changing configs, restart the services:

* `sudo sv restart osmo-nitb osmo-bts osmo-trx`

Osmocom logs are at `/var/log/osmo-trx/current`, `…/osmo-nitb/…` and `…/osmo-bts/…`.

Refer to Osmocom documentation for details:

* [OpenBSC home page](http://openbsc.osmocom.org/)
* [OsmoNITB parameters](http://openbsc.osmocom.org/trac/wiki/osmo-nitb_VTY)

### How to view/change subscribers

* subscribers are stored in `/etc/osmocom/hlr.sqlite3`, which is an SQLite database file
* you can view or change the database with `sqlite3` command, e.g.:

```
$ sudo sqlite3 /etc/osmocom/hlr.sqlite3
sqlite> .header on
sqlite> select * from Subscriber;
id|created|updated|imsi|name|extension|authorized|tmsi|lac|expire_lu
1|2014-07-16 08:49:48|2014-07-16 16:58:02|1018961291314||23686|0|233667473|0|2014-07-16 11:56:32
sqlite>
```

If you change [auth policy](http://openbsc.osmocom.org/trac/wiki/osmo-nitb_VTY#authpolicy) to `closed`, handsets would fail to register. But it would still create new entry in subscribers table. Set authorised to `1` to allow the handset to your network. E.g.:

```
sqlite> update Subscriber set authorized=1 where imsi=1018961291314;
```

### How to configure telephony

Making calls between mobile phones connected to the same UmSITE is interesting, but not enough. We also want to place calls to the outside world or receive calls from there. There are two ways to connect UmSITE to outside.

First way is a traditional GSM way. We won't cover it at the moment.

Second way is a VoIP way. Here's how it looks like:

                                                                \ | /
                                                                 \|/
                                                                  |
                                                                  |
            internet  |------------|       |-----------|          |
    VoIP   <--------->| FreeSWITCH | <---> | Osmocom   | <----> UmTRX
    server  (or LAN)  |            |       | GSM stack |
                      |------------|       |-----------|

                    |                                                 |
                    |-------------------------------------------------|
                                        UmSITE

Inside UmDESK - alongside Osmocom stack - runs an open source telephony switch and VoIP server, called FreeSWITCH. FreeSWITCH - in addition to routing calls inside UmDESK - can route calls from (and to) an external VoIP server.

You configure FreeSWITCH by changing its configuration files in `/usr/local/freeswitch/conf` directory.  To load new FreeSWITCH config, run `sudo sv restart freeswitch` or reload dial plan configuration: run `/usr/local/freeswitch/bin/fs_cli` and enter `reloadxml` command.

FreeSWITCH logs are at `/usr/local/freeswitch/log/` and `/var/log/freeswitch/current`. You can watch logs with `tail` command, e.g.:

```
tail -f /var/log/freeswitch/current
```

TODO: recommend a way to configure FreeSWITCH.

Refer to FreeSWITCH documentation for details:

* [Dialplan XML](https://wiki.freeswitch.org/wiki/Dialplan_XML)
* [FreeSWITCH documentation](https://wiki.freeswitch.org/wiki/Documentation/User_Documentation)
* [Reloading](http://wiki.freeswitch.org/wiki/Reloading).
