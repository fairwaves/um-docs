## Fairwaves Architecture


The Fairwaves Architecture defines a set of components, protocols, services and configurations used to build cost-optimized mobile networks in rural and remote areas.

In contrast to the traditional GSM architecture that is highly centralized, dependent upon backhaul and making
heavy use of this, the Fairwaves Architecture is built upon a distributed VoIP core that benefits from local
switching and is resilient to network failure.

All the functions of a mobile network are integrated into a single, self-contained cellular base station, that is built
to withstand the elements and suited to being powered from off-grid energy sources such as solar. Scaling and
integration with operator networks is made possible via local and cloud-based UmCORE servers.

The Fairwaves Architecture significantly reduces the financial and technical barriers to deploying cellular
networks, while ensuring that during their operation backhaul costs are minimised thanks to local call routing and
use of effective voice compression algorithms.

Designed from the ground up for flexibility, Fairwaves mobile networks can be operated independently,
interconnected, and integrated with existing PLMN, PSTN and private cellular networks, with support for roaming
and industry standard billing protocols.

The Fairwaves Architecture enables mobile networks to be installed, commissioned and generating revenue in as
little as one day, proving markets and providing an early return on investment for both new and existing
operators. 

##Components

**Radio Access Network (RAN)**

**UmSITE**

The UmSITE is more than simply a rugged BTS and is essentially a complete network-in-a-box, seamlessly
integrating functionality that is usually provided by GSM components such as BSC, MSC, VLR, HLR and SMSC.
Its software-centric design enables unprecedented flexibility, supporting remote configuration, maintenance and
upgrade, and covering everything from transmit power control to end user features.

**Key specifications:**

 - GSM 850/900/1800/1900
 - Dual-TRX, supporting up to 30 concurrent calls
 - Available with 2x3W or 2x10W TX output power
 - Omnidirectional and sectorized antenna installations
 - IP backhaul and VSAT optimization
 - Carrier integration via VoIP and SS7
 - A5/0, A5/1, A5/2 and A5/3 ciphering
 - GPSDO reference (OCXO on request)
 - IP65 (IP67 available on request)
 - Proven open source technology


#### Core Network

The UmCORE technology provides synchronization across distributed UmSITE installations, and enables
integration with existing networks via VoIP and SS7.

**Features include:**

 - System management console
 - Dynamic network information
 - Event logging
 - Billing
 - HLR
 
UmCORE is available in customer co-located and cloud versions.

**UmCORE Local**

UmCORE Local is a turnkey solution comprised of a compact low power server loaded with preconfigured
software, designed for ease of deployment and customer co-location.

UmCORE Local can be managed and upgraded remotely via a secure VPN link.

**UmCORE Cloud**

UmCORE Cloud is a hosted solution that provides an additional layer of resilience and is used to enable
integration with existing operator networks via a VoIP-SS7 gateway.

## Protocols

The Fairwaves Architecture eschews the complexity typically found in traditional GSM networks, in favour of a
simplicity that facilitates rapid deployment and ease of use. This is reflected in the protocols that are used to
create and interconnect networks. These are:

 - SIP for voice interconnect and value-added services
 - SMPP for SMS peering and value-added services
 - SS7 where required for PSTN and MNO interconnection
 - CAMEL and Diameter for integration with billing systems

A flat IP architecture, SIP and SMPP are used to build distributed network cores, which means that low cost
backhaul can be employed and highly specialist skills are not needed.

SS7 is only used where this is required for interconnection with existing operator networks, and this is typically
implemented via Fairwaves hosted UmCORE Cloud services.

Integration with operator billing and real-time settlement systems is made possible via the CAMEL and Diameter
— both offline (Rf) and online (Ro) interfaces — protocols.

## Services

**Voice and SMS**

Affordable, reliable voice and SMS communications are the primary services supported by the Fairwaves Architecture.

**Data**

Wi-Fi technology is generally recommended for the provision of data services, since it is:

 - Commonly available
 - Affordable and cost-efficient
 - Capable of supporting high data rates

Perhaps most importantly, Wi-Fi does not use up valuable cellular capacity, which is very often a key
consideration for cost-constrained networks operating under heavy load.


**GPRS and EDGE**

While it is presently not considered to be of production quality and part of the supported Fairwaves Architecture,
GPRS is available for testing purposes. The low bandwidth of GPRS and capacity considerations aside, it should
not be enabled in production networks.

EDGE provides a modest improvement on the data transfer speeds provided by GPRS, and support is currently
in development, but not available for testing at the present time.

*Those with GPRS and EDGE requirements should contact Fairwaves to ascertain their current development
status.*

**Value-added services**

Thanks to use of SIP and SMPP protocols, the Fairwaves Architecture supports the rapid development of valueadded
voice and messaging services. For example:

 - On-demand news
 - Event updates
 - Mobile payments
 - Polls and surveys
 - Voice and SMS chat
 - Telehealth applications
 - Location based services
 - 
Such services allow for flexible pricing that is based upon user value, providing an excellent source of additional
revenue and enabling partnership opportunities.

## Configurations

The Fairwaves Architecture scales all the way from a self-contained single site network, through multi-site
installations, to full integration with existing mobile operator networks.

**Single site**

The simplest possible deployment is a single UmSITE that supports intra-network use only. Applications include
remote villages, disaster relief and military operations.

**Key features:**

 - No backhaul requirement
 - Can be deployed in a day

![](http://s019.radikal.ru/i612/1508/33/84fcb12e0853.png)

A single base station provides coverage of up to 10km, depending upon the landscape.

**Dual-site**

Up to two villages can be connected via a microwave radio or long range Wi-Fi etc. link.

![](http://s50.radikal.ru/i130/1508/bc/22142888e5f3.png)

A distributed core ensures that calls can still be made, and SMS messages sent and received, within each area
of coverage in the event of link failure.

**Multi-site**

In order to connect three or more sites a UmCORE Local server is required

![](http://s017.radikal.ru/i400/1508/d9/7c73384d9ae5.png)


**The UmCORE Local provides:** 

 - HLR and billing synchronization
 - System management console
 - Dynamic network information
 - Event logging
 - 
Once again, thanks to a distributed core calls can still be made, and SMS messages sent and received, within
each area of coverage in the event of link failure.

## MNO Integration

Integration with existing Mobile Network Operator (MNO) core networks is supported via MAP roaming protocols
over SS7 and SIGTRAN links. Billing system integration is made possible via support for CAMEL and Diameter
protocols.

This configuration allows for existing MNO SIM cards to be used.

External traffic is routed to and from the MNO core network via the UmCORE Cloud, which provides a gateway
service, along with an additional layer of distributed HLR resilience.

![](http://s018.radikal.ru/i504/1508/f8/e25212f3df0e.png)

UmCORE Cloud automatically retrieves charging data from UmSITE/UmCORE Local and is used to provide
integration with external billing systems. Real-time settlement of prepaid accounts is also possible. Indeed, the
Fairwaves billing gateway can be customized to fit most MNO system requirements, both in terms of format and
behavior.

In this configuration Fairwaves networks typically service customers in rural and remote zones and may be
considered subnetworks of the MNO, which continues to service customers in urban zones using existing
infrastructure.

It should be noted that while roaming describes the technical implementation and behaviour, a single operator is
assumed; subscribers who are located in rural areas remain customers of the same MNO and use the same
billing and payment mechanisms.

*Experiences to-date have shown that the most popular pricing plan for rural communities is a fixed price for
unlimited calls and SMS within the remote area of coverage, and charging based on use for calls and messages
routed via the MNO core.*

**Capacity and coverage scale-out**

The network capacity and coverage of all of the configurations previously described may be increased by
deploying additional UmSITEs, either co-located or remote and connected to a primary site via a reliable network
link.

![](http://s017.radikal.ru/i416/1508/6a/6b6ba8fba1e9.png)

The first UmSITE is configured as master and along with serving as a BTS it implements GSM functions such as
BSC, MSC, VLR, HLR and SMSC. However, the second UmSITE is configured as slave and operates as a BTSonly.
A reliable network link is recommended since the slave will become inoperable in the event of link failure

## Summary of benefits

In short, the Fairwaves Architecture provides the foundations for a new breed of mobile network that is distributed
in nature, but which retains centralised control and billing. Networks can start out small and, where backhaul is
not initially available, operate independently, and then be interconnected with minimum effort at a later date. As
such they offer the possibility of earlier revenue generation for new and existing operators alike.

**Technical:**

 - Easy to install
 - Local call routing
 - Network failure resilience
 - Flat IP architecture


**Economic:**

 - Low-cost turnkey base station
 - Zero maintenance
 - Greatly reduced backhaul costs
 - Low power consumption
 - Can be generating revenue in a day!








