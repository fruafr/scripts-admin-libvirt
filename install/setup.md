To setup libvirt/KVM you will need to run the following scripts:

# For Debian (Ubuntu) family systems

`bash ./install/debian.sh`

`bash ./install/user_group.sh USERNAME`
USERNAME is the name of the user to add to the libvirt and the kvm groups

## Optional:

Install tools to customize iso installation volumes and guest images
`bash ./install/iso_vol_cust_install_apt.sh`

# For RedHat Family systems : 

Supports version 8, maybe others.

## With yum (e.g. CentOS)

`bash ./install/redhat_yum.sh`

`bash ./install/user_group.sh USERNAME`
USERNAME is the name of the user to add to the libvirt and the kvm groups

## Optional:

Install tools to customize iso installation volumes and guest images
`bash ./install/iso_vol_cust_install_yum.sh`

## With dnf (e.g. Fedora)

`bash ./install/redhat_dnf.sh`

`bash ./install/user_group.sh USERNAME`
USERNAME is the name of the user to add to the libvirt and the kvm groups

## Optional:

Install tools to customize iso installation volumes and guest images
`bash ./install/iso_vol_cust_install_dnf.sh`

