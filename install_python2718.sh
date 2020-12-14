#!/bin/sh -e
set -x #echo on

# Source: http://toomuchdata.com/2012/06/25/how-to-install-python-2-7-3-on-centos-6-2/
cd ~
yum install -y zlib-devel; yum clean all -y
yum install -y bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel; yum clean all -y
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
tar xf Python-2.7.18.tar.xz
cd Python-2.7.18
./configure --prefix=/usr/local
make altinstall -j$(nproc)
cd ~
rm -rf Python-2.7.18*

wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python2.7 get-pip.py
rm -rf get-pip.py

pip2.7 install -U pip setuptools
