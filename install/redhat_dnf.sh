#!/bin/bash
# redhat_dnf.sh
# Install libvirt/KVM on RedHat Family distributions (CentOS) using dnf
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
   echo "Install libvirt/KVM on RedHat Family distributions (CentOS) using dnf"
   echo "Inspired by https://phoenixnap.com/kb/install-kvm-centos"
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

echo 'Installing packages'
#sudo dnf install -y @virt
#is equivalent to
sudo dnf install -y qemu-kvm libvirt libguestfs-tools
#add additional packages
sudo dnf install -y bridge-utils virt-install libosinfo
#add additional packages for KVM management
sudo dnf -y install virt-top libguestfs-tools

echo 'Enable and start daemon'
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
sudo systemctl status libvirtd

echo "Libvirt/KVM - INSTALL - Task completed..."
