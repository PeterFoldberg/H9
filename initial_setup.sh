read -p "Enter IP: " ip_var
read -p "Enter hostname: " hostname_var

sudo hostnamectl set-hostname $hostname_var
sudo echo "$hostname_var" > /etc/hostname


sudo echo "127.0.0.1 localhost
127.0.1.1 $hostname_var

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" > /etc/hosts

sudo echo "network:
    version: 2
    renderer: networkd
    ethernets:
        ens160:
            addresses:
                - $ip_var/24
            nameservers:
              #search: [mydomain, otherdomain]
                addresses: [192.168.1.11, 192.168.1.12]
            routes:
                - to: default
                  via: 192.168.1.99" > /etc/netplan/00-installer-config.yaml

sudo netplan apply


sudo reboot

