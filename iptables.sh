#!/bin/bash

#IP TABLES Block Ping Rqusest to Server

iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j REJECT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p icmp --icmp-type echo-reply -j DROP
iptables -A INPUT -p tcp -m state -m tcp --dport 21 --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m state -m tcp --dport 22 --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m state -m tcp --dport 25 --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m state -m tcp --dport 53 --state NEW -j ACCEPT
iptables -A INPUT -p udp -m state -m udp --dport 53 --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m state -m tcp --dport 80 --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m state -m tcp --dport 443 --state NEW -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT



#Teamspeak3

iptables -A INPUT -p udp --dport 9987 -j ACCEPT
iptables -A INPUT -p udp --sport 9987 -j ACCEPT
iptables -A INPUT -p tcp --dport 30033 -j ACCEPT
iptables -A INPUT -p tcp --sport 30033 -j ACCEPT
iptables -A INPUT -p tcp --dport 10011 -j ACCEPT
iptables -A INPUT -p tcp --sport 10011 -j ACCEPT


#COD4
iptables -A INPUT -p udp --dport 28961 -j ACCEPT
iptables -A INPUT -p udp --sport 28961 -j ACCEPT
iptables -A INPUT -p tcp --dport 28961 -j ACCEPT
iptables -A INPUT -p tcp --sport 28961 -j ACCEPT
iptables -A INPUT -p udp --dport 28960 -j ACCEPT
iptables -A INPUT -p udp --sport 28960 -j ACCEPT
iptables -A INPUT -p tcp --dport 28960 -j ACCEPT
iptables -A INPUT -p tcp --sport 28960 -j ACCEPT

#Show Tables
iptables -L

