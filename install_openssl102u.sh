#!/bin/bash -e
cd ~
wget --no-check-certificate --content-disposition https://github.com/openssl/openssl/archive/OpenSSL_1_0_2u.tar.gz
tar xf openssl-OpenSSL_1_0_2u.tar.gz
cd openssl-OpenSSL_1_0_2u
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared
make; make install
cd ~
rm -rf openssl-OpenSSL_*
echo "/usr/local/openssl/lib" > /etc/ld.so.conf.d/openssl.conf
ldconfig -v
