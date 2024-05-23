sudo apt install slapd ldap-utils

echo "dn: uid=pfo,ou=people,dc=grp3,dc=it
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: pfo
cn: Peter
sn: Foldberg
mail: pfo@grp3.it
postalCode: 9000
userPassword: Test1234!
uidNumber: 4000
gidNumber: 2100
homeDirectory: /home/pfo
loginShell: /bin/bash

dn: uid=brian,ou=people,dc=grp3,dc=it
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: brian
cn: Brian
sn: Brian
mail: brian@grp3.it
postalCode: 9000
userPassword: Test1234!
uidNumber: 5000
gidNumber: 2100
homeDirectory: /home/brian
loginShell: /bin/bash

dn: uid=kpo,ou=people,dc=grp3,dc=it
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: kpo
cn: Kimmy
sn: Kimmy
mail: kpo@grp3.it
postalCode: 9000
userPassword: Test1234!
uidNumber: 6000
gidNumber: 2100
homeDirectory: /home/kpo
loginShell: /bin/bash

dn: uid=mks,ou=people,dc=grp3,dc=it
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: mks
cn: Mathias
sn: Mathias
mail: mks@grp3.it
postalCode: 9000
userPassword: Test1234!
uidNumber: 7000
gidNumber: 2100
homeDirectory: /home/mks
loginShell: /bin/bash" > testusers.ldif

echo "dn: ou=people,dc=grp3,dc=it
objectClass: organizationalUnit
ou: people

dn: ou=groups,dc=grp3,dc=it
objectClass: organizationalUnit
ou: groups" > basegroup.ldif



echo "dn: cn=admins,ou=groups,dc=grp3,dc=it
objectClass: posixGroup
cn: admins
gidNumber: 2100" >testgroup.ldif


sudo ldapadd -x -D cn=admin,dc=grp3,dc=it -W -f basegroup.ldif
sudo ldapadd -x -D cn=admin,dc=grp3,dc=it -W -f testgroup.ldif
sudo ldapadd -x -D cn=admin,dc=grp3,dc=it -W -f testusers.ldif
