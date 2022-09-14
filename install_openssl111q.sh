#!/bin/bash -e
set -x #echo on
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1q.tar.gz
tar xf openssl-OpenSSL_1_1_1q.tar.gz
cd openssl-OpenSSL_1_1_1q
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared
make -j$(nproc); make install
cd ~
rm -rf openssl-OpenSSL_*
echo "/usr/local/openssl/lib" > /etc/ld.so.conf.d/openssl.conf
ldconfig -v
