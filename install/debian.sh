#!/bin/bash
# debian.sh
# Install libvirt/KVM on Debian Family distributions (ubuntu)
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

set -e

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Install libvirt/KVM on Debian Family distributions (ubuntu)"
   echo "Inspired by https://linuxgenie.net/how-to-install-kvm-on-ubuntu-22-04/"
}

#################################
# Options and arguments         #
#################################

if [[ $1 == "--help" ]]; then
    # display Help
    Help
    exit
fi

# Get the options
while getopts ":h" option; do
   case $option in
     h) # display Help
         Help
         exit;;
     /?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

#############################
# Main program              #
#############################

echo "Libvirt/KVM - INSTALL - Task starting..."

echo 'System update'
sudo apt update

echo 'Installing packages'
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst

echo 'Enable and start daemon'
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
sudo systemctl status libvirtd

echo "Libvirt/KVM - INSTALL - Task completed..."
