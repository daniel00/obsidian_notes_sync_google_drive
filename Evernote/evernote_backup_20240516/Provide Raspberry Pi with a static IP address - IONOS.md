---
source: https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/
created: 2023-02-08 22:57.59
updated: 2023-02-08 22:57.59
---
![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_platine-t_cecb3174f4.jpg]]

# How to set a Raspberry Pi with a static ip address?

A **static IP address**, as opposed to a dynamic IP address, doesn’t change. The single-board computer [Raspberry Pi](https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/) always needs a static IP address if you want to access it with other devices over a long period of time. This refers to the **private IP address of the Raspberry IP** that is located by a computer within the local network as well as the **public IP address of the network** via which the Raspberry Pi is accessible on the internet (for example, if it’s being used as a server). But how do you provide Raspberry Pi with an IP address that always remains the same? This guide explains which options you have for linking a static IP address to your Raspberry Pi.

**Contents**<https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#>

1. [Addressing Raspberry Pi via a static IP address](https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#c87760)

* [Assign a static private IP address to Raspberry Pi with a router](https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#c87763)
* [Assign a static private IP address to Raspberry Pi with DHCPCD](https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#c87764)
* [Static IP addresses for Raspberry Pi are sometimes vital](https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#c87777)

$1 Domain Names

Register great TLDs for less than $1 for the first year.

Why wait? Grab your favorite domain name today!

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/ionos-checkmark.png]]_Matching email_
![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/ionos-checkmark.png]]_SSL certificate_
![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/ionos-checkmark.png]]_24/7/365 support_

## Addressing Raspberry Pi via a static IP address

For many projects with the small computer, it’s either useful or necessary to provide Raspberry Pi with a static IP address. But before we talk more specifically about the use of such a static IP address with Raspberry Pi, we’ll first outline the differences between addressing a computer **in a private (local) network** or on the **publicly accessible internet**. Private and public IP addresses are not to be confused with each other.

### Addressing Raspberry Pi in the LAN via a private IP address

Within a local network (also called a Local Area Network, or LAN for short), a router distributes data to various devices. The router is also responsible for IP address assignment – more specifically, the **DHCP server** integrated in the router is responsible. For example, the DHCP (Dynamic Host Configuration Protocol) automatically assigns free IP addresses to the corresponding devices. Computers, smart TVs, smartphones, or a Raspberry Pi each receive such an address via which they can communicate with other devices. Therefore, all devices are uniquely identifiable via their so-called [MAC address](https://www.ionos.com/digitalguide/server/know-how/mac-address/).

Since IP addresses in a private network are individually assigned by the DHCP and the coupling of devices to an IP address is only valid within your local network, here we’re talking about **private IP addresses**. In the default settings, Raspberry Pi also receives its IP address via the DHCP server. The private IP addresses of individual devices can change though, depending on the configuration of the DHCP server.

To be able to reach Raspberry Pi on the same address in your own LAN, you have to provide it with a **static, private IP address**. One such static IP address for Raspberry Pi can be used, for example, for the **remote maintenance of a computer within the network protocol SSH** (Secure Shell): If you have an SSH program installed, you can control the Raspberry Pi via another computer using the SSH client. This has the advantage that you don’t have to connect a monitor and input device separately for operation anymore. But if the minicomputer only has a dynamic private IP address, then you have to reselect the current IP address for every SSH access and link it to the SSH client – you bypass this step with a static private IP address.

A static private IP address is essential for your Raspberry Pi if you want to set it up as a **server in the LAN**. If the Raspberry Pi server is also to continue being available outside of the local network, then you have to assign it another static address via which the server can be accessed on the internet. For example, an internet connection with a static public IP address or a DDNS service.

### Addressing the Raspberry Pi on the internet via a public IP address or DDNS

If the Raspberry Pi is to be used as a server accessible over the internet, then the public IP address of your internet connection comes into play. Most internet access is available via dynamic IP addresses that are changed every time they start and at the latest every 24 hours. This **changes the public IP address** with which the Raspberry Pi server can be reached.

If you want to set up your [Raspberry Pi as an ownCloud server](https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/) or in another server form, the following problem occurs: As soon as the server receives a new IP address, it can only be traced in the LAN. If you want to be found outside of the local network, you no longer know which address the server can be reached on. The solution to this is a fixed IP address. The simplest variation here would be to use an internet connection with a **static public IP address**. But this is usually quite expensive, and isn’t offered by all internet service providers.

Another solution is the application of **dynamic DNS (DDNS)**. This links your dynamic public IP address with a domain name. Every time, as soon as your IP address changes, a program redirects the new address to the domain name and makes it permanently available on the internet. Now if you link a server on Raspberry Pi with the domain name, it’s permanently accessible online.

There are both free and paid DDNS services. Before you decide on one for yourself, you should first test **which DDNS providers your router supports, and whether it supports any at all**. Find the DDNS support tutorial for whichever individual router your DDNS server is intended to operate on, such as this [tutorial for Linksys routers](https://www.linksys.com/us/support-article?articleNum=142585).

## Assign a static private IP address to Raspberry Pi with a router

Many routers support the ability to provide individual devices within the local network with a static IP address. With a Linksys router, the [Linksys app](https://www.linksys.com/us/support-article?articleNum=203474) allows you to manage multiple devices and handle all of the router assignments remotely. Various other routers also support similar functions, and so can be used for linking Raspberry Pi with a static IP address.

A static IP address for Raspberry Pi is set up somewhat differently for each router. The basic principle is always the same, though: You open the user interface of the router in your browser; **Link the MAC address of Raspberry Pi with your LAN’s IPv4 address** via the manual IP configuration. Most of the time, a checkbox exists for this in the router interface. This enables you to always automatically use the IP address assigned to you.

## Assign a static private IP address to Raspberry Pi with DHCPCD

Raspbian Jessie, or Jessie Lite – the current Raspbian operating systems at the moment – have a **DHCP client daemon (DHCPCD)** that can communicate with the DHCP servers from routers. The configuration file of a DHCP client daemon allows you to change the private IP address of a computer and set it up in the long term. The following instructions will assign a static IPv4 address with 32 bits (not to be confused with an [IPv6 address](https://www.ionos.com/digitalguide/server/know-how/what-are-the-benefits-of-ipv6/), which has 128 bits available) to the Raspberry Pi.

Before you begin with the assignment of a private IP address for Raspberry Pi, **check whether DHCPCD is already activated** using the following command:

    sudo service dhcpcd status

In case it’s not, activate DHCPCD as follows:

    sudo service dhcpcd start
    sudo systemctl enable dhcpcd

Now make sure that the configuration of the file _/etc/network/interfaces_has the **original status**. For this, the ‘iface’ configuration needs to be set at ‘manual’ for the interfaces.

For the editing of the activated DHCPCDs, start by opening the **configuration file _/etc/dhcpcd.conf_**and running the following command:

    sudo nano /etc/dhcpcd.conf

You’ll now carry out the configuration of the static IP address. If your Raspberry Pi is connected to the internet via an Ethernet or network cable, then enter the command ‘interface eth0’; if it takes place over Wi-Fi, then use the ‘interface wlan’ command.

To assign an IP address to Raspberry Pi, use the command ‘**static ip\_address=**’ followed by the **desired IPv4 address** and the suffix ‘**/24**’ (an abbreviation of the subnet mak _255.255.255.0_). For example, if you want to link a computer with the IPv4 address _192.168.0.4_, then you need to use the command ‘static ip\_address=192.168.0.4/24’. It goes without saying that the address used here is not yet used anywhere else. As such, it also can’t be located in the address pool of a DHCP server.

You still then need to specify the address of your gateway and domain name server (usually both are the router). Raspberry Pi turns to the gateway address if an IP address to which it wants to send something is outside of the subnet mask (in the example, this would mean outside of the range 192.168.0). In the following command, the IPv4 address _192.168.0.1_ is used as an example as both the gateway and DNS server. The complete command looks like this in our example (where a network cable is used for the internet connection):

    interface eth0
    static ip_address=192.168.0.4/24
    static routers=192.168.0.1
    static domain_name_servers=192.168.0.1

The **command lines above match the IPv4 addresses** that you want to use for your Raspberry Pi, or where your router is assigned. Save the changes with ‘Ctrl + O’ and then press the enter key. Close the configuration file with ‘Ctrl + X’. Restart to adopt the newly assigned static IP address in the network:

    sudo reboot

Now use a **ping command** to check whether the Raspberry Pi is accessible in the network with its new IP address:

    Ping raspberrypi.local

If the connection of the IP address was successful, you’ll see that you can reach it under the new IP address with a ping.

## Static IP addresses for Raspberry Pi are sometimes vital

In summary, it should be noted that there are basically two different IP addresses that are relevant for Raspberry Pi (and projects using it): the private IP address of the Raspberry Pi within the local network, and the public IP address of its internet connection.

A **static private IP address** is primarily necessary if you want to use **Raspberry Pi as a server**. But if you access the minicomputer via SSH more frequently, you should assign in a static address in the same way. The possibilities outlined above detail how this can be achieved with relatively simple means.

Assigning a **fixed public address** that allows your Raspberry Pi to be **accessed via the internet** is somewhat more complicated. This is necessary, for example, when attempting to make your server installed on Raspberry Pi remain constantly available online. Most internet access is available only via a dynamic public IP address, which isn’t possible here. Since a static address isn’t offered by all internet providers (and if it is, then it’s usually relatively expensive), a DDNS service presents the best solutions. But for this, you have to know which forms of dynamic DNS are supported by your router.

* 29.11.22

* [Configuration](https://www.ionos.com/digitalguide/server/configuration/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/&text=Equip%20Raspberry%20Pi%20with%20a%20static%20IP%20address&url=https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/>
	* [Network](https://www.ionos.com/digitalguide/tags/network/)
	* [Open Source](https://www.ionos.com/digitalguide/tags/open-source/)
	* [Tools](https://www.ionos.com/digitalguide/tags/tools/)
**Related articles**

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_platine-t_edb1bc61b2.jpg]]

30 Raspberry Pi projects that show the possibilities of the mini computer

* 04.07.2022

* Know-how

Raspberry Pi is an inexpensive micro-computer that can behave like a standard computer in many respects. The innovative mini device can be used for a wide range of tasks - from setting up an operating system to surfing the web, to using it as a server or a media center. Discover 30 interesting Raspberry Pi projects to try out at home.

[30 Raspberry Pi projects that show the possibilities of the mini computer](https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/&text=30%20Raspberry%20Pi%20projects%20that%20show%20the%20possibilities%20of%20the%20mini%20computer&url=https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/know-how/raspberry-pi-projects/>

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_platine-t_edb1bc61b2.jpg]]

Using Raspberry Pi as a web server

* 03.11.2020

* Configuration

Have you always wanted to operate your own web server? Raspberry Pi makes this goal more realistic, without commanding a high price and expert-level knowledge for set-up: hosting a website’s test environment or a private cloud is just as manageable for the small computer as controlling light sources, heaters, or other home devices (home automation). In our tutorial, you’ll find out all you need to...

[Using Raspberry Pi as a web server](https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/&text=Using%20Raspberry%20Pi%20as%20a%20web%20server&url=https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/configuration/set-up-a-raspberry-pi-web-server-with-lamp/>

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_platine-t_edb1bc61b2.jpg]]

Raspberry Pi mail server: using Raspberry Pi to manage e-mails

* 29.10.2021

* Configuration

Why use e-mail servers from commercial e-mails service providers when you can just set up your own? You can create a private server easily and affordably with a small computer known as Raspberry Pi. Having your own e-mail server, however, requires a certain amount of work and also has its disadvantages. You can find out more about how to set up your personal Raspberry Pi mail server in this...

[Raspberry Pi mail server: using Raspberry Pi to manage e-mails](https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/&text=Raspberry%20Pi%20mail%20server:%20using%20Raspberry%20Pi%20to%20manage%20e-mails%20&url=https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/configuration/set-up-your-own-raspberry-pi-mail-server/>

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_platine-t_edb1bc61b2.jpg]]

Creating a Raspberry Pi cloud server with owncloud

* 30.08.2019

* Configuration

With ownCloud software, your Raspberry Pi can be used as a private cloud, performing the same kind of tasks as clouds from major providers such as Google, Amazon, and Dropbox. Cost-effectiveness is just one of many the benefits of creating your own personal cloud; another is the privacy and security of your data. This step-by-step Raspberry Pi cloud tutorial explains how to set up ownCloud.

[Creating a Raspberry Pi cloud server with owncloud](https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/&text=Creating%20a%20Raspberry%20Pi%20cloud%20server%20with%20owncloud&url=https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/configuration/set-up-owncloud-with-raspberry-pi/>

![[./_resources/Provide_Raspberry_Pi_with_a_static_IP_address_-_IONOS.resources/csm_netzwerkadressuebersetzung-t_182e3b7855.jpg]]

What is DHCP Snooping?

* 10.01.2023

* Security

DHCP snooping makes a network more secure. There are no two ways about it: DHCP makes network configuration so much easier. This is especially the case in large networks, where devices are constantly changing and the manual assignment of IP addresses is a never-ending task. Yet by using DHCP to simplify the process, you do relinquish controls, and criminals can take advantage of this. By using...

[What is DHCP Snooping?](https://www.ionos.com/digitalguide/server/security/dhcp-snooping/)

* <https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.com/digitalguide/server/security/dhcp-snooping/>

* <https://twitter.com/intent/tweet?source=https://www.ionos.com/digitalguide/server/security/dhcp-snooping/&text=What%20is%20DHCP%20Snooping?&url=https://www.ionos.com/digitalguide/server/security/dhcp-snooping/&hashtags=DigitalGuide>
* <https://www.xing.com/spi/shares/new?url=https://www.ionos.com/digitalguide/server/security/dhcp-snooping/>
* <https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.com/digitalguide/server/security/dhcp-snooping/>
