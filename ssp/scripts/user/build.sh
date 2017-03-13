#!/usr/bin/env bash
set -eu

# build a configurator
wget http://www.toppers.jp/download.cgi/cfg-1.8.0.tar.gz
tar xvf cfg-1.8.0.tar.gz
cd cfg
./configure --with-libraries=/usr/lib/x86_64-linux-gnu/
make
cd ..

# build a SSP kernel
wget http://www.toppers.jp/download.cgi/ssp-1.3.0.tar.gz
tar xvf ssp-1.3.0.tar.gz
cd ssp
ln -s ../cfg cfg
mkdir build; cd build
perl ../configure -T cq_frk_fm3_gcc
make depend
make

exit 0
