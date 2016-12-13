#!/bin/bash
#
if [ $# -eq 0 ] ; then
  echo "Usage: $0 'secret'"
  exit
fi

secret="$1"
keystore_file="app/ht5tc.keystore"
key_name="ht5tc"
name='TableClock'
dept='N/A'
org='HyperTechonology5'
place='Den Haag'
province='ZH'
country='NL'

rm -f "$keystore_file"
keytool -genkey -v -keystore "$keystore_file" -alias "$key_name" -keyalg "RSA" -validity 10000 -storepass "$secret" -keypass "$secret" <<EOF
$name
$dept
$org
$place
$province
$country
yes
EOF
travis encrypt "KEYSTORE_SECRET=$secret" --add env.global
