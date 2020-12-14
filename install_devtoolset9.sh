#!/bin/bash -e
set -x #echo on
yum install -y centos-release-scl-rh ; yum clean all -y
sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror.centos.org\/centos\/6\//baseurl=http:\/\/vault.centos.org\/6.10\//g' /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
yum install -y devtoolset-9 devtoolset-9-gcc-c++ devtoolset-9-binutils devtoolset-9-libquadmath-devel devtoolset-9-gdb devtoolset-9-gdb-gdbserver devtoolset-9-perftools devtoolset-9-libasan-devel devtoolset-9-liblsan-devel devtoolset-9-libtsan-devel devtoolset-9-libubsan-devel devtoolset-9-valgrind-devel; yum clean all -y
