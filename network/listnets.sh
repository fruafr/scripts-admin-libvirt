#!/bin/bash
# listnets.sh
# Libvirt/KVM - Lists all libvirt networks
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

echo 'Libvirt/KVM - NETWORKING - List networks'
echo ''
sudo virsh net-list --all