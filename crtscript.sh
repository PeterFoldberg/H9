echo "PREREQ: ca cert and key should be in /root/"
read -p "Enter CN - Example; git01: " cn_var
read -p "Enter IP: " ip_var
domain=grp3.it

openssl req -new -nodes -out /root/$cn_var.$domain.csr -newkey rsa:4096 -keyout /root/$cn_var.$domain.key -subj "/CN=$cn_var/C=DK/ST=Nordjylland/L=Aalborg/O=grp3"


cat > /root/$cn_var.$domain.v3.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $cn_var.$domain
DNS.2 = $cn_var.$domain
IP.1 = $ip_var
EOF

openssl x509 -req -in /root/$cn_var.$domain.csr -CA /root/ca01.crt -CAkey /root/ca01.key -CAcreateserial -out /root/$cn_var.$domain.crt -days 825 -sha256 -extfile /root/$cn_var.$domain.v3.ext

