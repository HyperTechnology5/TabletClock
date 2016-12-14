#!/bin/bash
err=":"
for v in KEYSTORE_SECRET OWM_API_KEY
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

sed \
  -i~ \
  -e "s!<OWM_API_KEY>!$OWM_API_KEY!" \
  app/src/main/java/lcf/weather/OWMUrl.java
