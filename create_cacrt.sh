read -p "Enter host - example; ca01: " host

openssl genrsa -aes256 -out $host.key 4096

openssl req -x509 -new -nodes -key $host.key -sha256 -days 3650 -out $host.crt -subj "/CN=$host/C=DK/ST=Nordjylland/L=Aalborg/O=grp3"
