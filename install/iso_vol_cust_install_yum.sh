#!/bin/bash
# iso_vol_cust_install_yum.sh
# Libvirt/KVM - Install OS Customization and guess image modification packages - yum version
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task starting..."
sudo yum install -y libguestfs genisoimage
echo "Libvirt/KVM - Install OS Customization and guess image modification packages - Task completed..."
