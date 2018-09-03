#!/bin/bash

set -e

WS=$PWD
cd web
#npm install
#npm run build
cd $WS

echo "build..."
export CC="musl-gcc"
go build -o sysmon -ldflags '-linkmode "external" -extldflags "-static"'

echo "pack..."

DST=$(mktemp -d)
mkdir $DST/sysmon
DST=$DST/sysmon
cp -rvf sysmon views conf web/dist install.sh onboot $DST
mkdir $DST/web
mv $DST/dist $DST/web/
sed -i 's/runmode = dev/runmode = prod/g' $DST/conf/app.conf
cd $DST/../ && tar zcvf $WS/sysmon.tar.gz *
cd $WS
