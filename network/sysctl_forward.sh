#!/bin/bash
# sysctl_forward.sh
# Libvirt/KVM - Append lines to /etc/sysctl.conf to allow forwarding to VMs
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

echo "Libvirt/KVM - Allowing forwarding in /etc/sysctl.conf - Task Starting"

echo 'Enable IPv4 forwarding in /etc/sysctl.conf'
sudo echo 'net.ipv4.ip_forward=1' | sudo tee -a /etc/sysctl.conf > /dev/null
echo 'Done"

echo 'Enable IPv4 forwarding in /etc/sysctl.conf'
sudo echo 'net.ipv6.conf.all.forwarding=1' | sudo tee -a /etc/sysctl.conf > /dev/null
sudo echo 'net.ipv6.conf.all.proxy_ndp=1' | sudo tee -a /etc/sysctl.conf > /dev/null
echo 'Done'

echo "Libvirt/KVM - Allowing forwarding in /etc/sysctl.conf - Task Completed"



