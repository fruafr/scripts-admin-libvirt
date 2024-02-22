#!/bin/bash
# create_default.sh
# Creates a default pool with the default directory (/var/lib/libvirt/images)
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

echo "Libvirt/KVM - POOLS - Creation of default pool in /var/lib/libvirt/images - Task starting..."

SCRIPT_DIR=$( cd-- "$( dirname -- "${BASH_SOURCE[0]}")"&> /dev/null && pwd)

sudo bash $SCRIPT_DIR/create.sh default /var/lib/libvirt/images
echo "KVM - POOLS - default created"

echo "Libvirt/KVM - POOLS - Creation of default pool in /var/lib/libvirt/images - Task completed..."
