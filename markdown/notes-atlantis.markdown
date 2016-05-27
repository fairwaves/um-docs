Notes while talking with Atlantis guys:

* overall architecture
* SDR
* ethernet
* bandwidth
* why not openbts?
    - stability
    - modularity (openbts is too сцепленная with sip)
    - goal (e.g. openbsc: implement gsm)
* SMS: locally, or forward via SMPP
* subscribers database: NITB - sqlite
* SSH: fairwaves:fairwaves
* DHCP or static IP 192.168.50.100
* edit /etc/osomocom/{openbsc,osmobts}.cfg
* `sudo sv restart osmo-nitb osmobts osmotrx freeswitch`
* nitb log: tail /var/log/osmonitb/current
* freeswitch log: tail /var/log/freeswitch/current
* about 100 mWatt by default (20 meters in office)
* *#100# to figure out phone number
* database in /etc/osmocom
* send test sms - try scripts
* freeswitch configuration: /usr/local/freeswitch/conf
* point to osmocom wiki: 
    - network-from-scratch
    - OsmoNITB VTY

* clock awesomeness

