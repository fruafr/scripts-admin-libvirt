#!/bin/bash
# iso_vol_cust_install_apt.sh - Libvirt/KVM - Install OS Customization and guess image modification packages - APT
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task starting..."
sudo apt install -y mkisofs libguestfs-tools genisoimage
echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task completed..."
