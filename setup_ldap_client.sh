sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt install -y libnss-ldap libpam-ldap ldap-utils nscd

sudo echo "base dc=grp3,dc=it
uri ldap://ldap01.grp3.it
ldap_version 3
rootbinddn cn=admin,dc=grp3,dc=it
" > /etc/ldap.conf


sudo echo "passwd: compat systemd ldap
group: compat systemd ldap
shadow: files ldap
gshadow:    files


hosts:          files dns
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis" > /etc/nsswitch.conf


sudo echo "#
password        [success=2 default=ignore]      pam_unix.so obscure yescrypt
password        [success=1 user_unknown=ignore default=die]     pam_ldap.so try_first_pass
password        requisite                       pam_deny.so
password        required                        pam_permit.so" > /etc/pam.d/common-password

sudo echo "session optional pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session

sudo echo "%admins ALL=(ALL:ALL) ALL" > /etc/sudoers.d/admins

sudo service nscd restart
