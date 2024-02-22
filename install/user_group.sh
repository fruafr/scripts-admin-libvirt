#!/bin/bash
# user_group.sh
# Libvirt/KVM Install - Make the user provided a member of the groups kvm and libvirt
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
   echo "Libvirt/KVM Install - Make the user provided a member of the groups kvm and libvirt"
   echo "Takes one argument : the name of the user"
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

if [[ $# -ne 1 ]]; then
  echo "Error: One argument (user name) is required. Use -h for help."
  exit 1
fi

#############################
# Main program              #
#############################

USER=$1

echo "Libvirt/KVM - Make the user $USER a member of kvm and libvirt groups - Task starting..."

sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

echo "Libvirt/KVM - Make the user $USER a member of kvm and libvirt groups - Task completed..."
