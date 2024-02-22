# scripts-admin-libvirt
Various bash scripts for libvirt/KVM admin tasks

## Folders

### ./install
- debian.sh : install libvirt/KVM on Debian Family distributions (ubuntu)
- redhat_yum.sh : install libvirt/KVM on RedHat Family distributions with yum (centos)
- redhat_dnf.sh : install libvirt/KVM on RedHat Family distributions with dnf (fedora)

- user_groups.sh : Make the user provided a member of the groups kvm and libvirt

- iso_vol_cust_install_apt.sh : Install tools to customize iso installation volumes and guest images - apt version
- iso_vol_cust_install_yum.sh : Install tools to customize iso installation volumes and guest images - yum version
- iso_vol_cust_install_dnf.sh : Install tools to customize iso installation volumes and guest images - dnf version

### ./pool
- create.sh : Creates a pool with a directory using virsh
- delete.sh : Deletes a pool with a directory using virsh
- create_default.sh : Creates a default pool with the default directory (/var/lib/libvirt/images)

### ./network
- netadd.sh : Setup and start a libvirt network. Set to autostart. Requires path to xml config file
- netinfo.sh : Display libvirt network information
- netdel.sh : Stop and remove a libvirt network
- listnets.sh : Lists all libvirt networks
- sysinfo.sh : Display system networking information (link, address, routes)
- sysctl_forward.sh : Append lines to /etc/sysctl.conf to allow forwarding to VMs

## License

Free to use, copy, modify and/or distribute. Released under the MIT License.