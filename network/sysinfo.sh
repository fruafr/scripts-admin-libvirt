#!/bin/bash
# sysinfo.sh
# Libvirt/KVM - Display system networking information (link, address, routes)
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

echo 'NETWORKING - Print host ip links'
echo ''
sudo ip link

echo 'NETWORKING - Print host ip addresses'
echo ''
sudo ip address

echo 'NETWORKING - Print host ip routes'
echo ''
sudo ip route
