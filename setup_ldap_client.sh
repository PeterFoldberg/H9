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

sudo service nscd restart
