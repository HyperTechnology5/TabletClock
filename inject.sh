#!/bin/bash
err=":"
for v in KEYSTORE_SECRET
do
  eval n=\"\$$v\"
  if [ -z "$n" ] ; then
    err="exit 1"
    echo "Missing $v"
  fi
done
$err

echo "Adjusting configuration..."
sed \
  -i~ \
  -e "s!<PASSWORD>!$KEYSTORE_SECRET!" \
  app/build.gradle

