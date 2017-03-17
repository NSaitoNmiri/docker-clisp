#!/usr/bin/env bash

set -e

wget http://www.toppers.jp/download.cgi/ssp-1.3.0.tar.gz
tar xvf ssp-1.3.0.tar.gz
for i in `find ssp -type f` ; do nkf --overwrite --oc=UTF-8 $i; done

wget https://www.toppers.jp/download.cgi/asp3-3.1.0.tar.gz
tar xvf asp3-3.1.0.tar.gz

cd ssp
ln -s ../asp3/configure.rb configure.rb
ln -s ../asp3/cfg cfg

exit 0
