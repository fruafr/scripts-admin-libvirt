#!/bin/bash
# iso_vol_cust_install_dnf.sh
# Libvirt/KVM - Install OS Customization and guess image modification packages - dnf version
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task starting..."
sudo dnf install -y libguestfs genisoimage
echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task completed..."
