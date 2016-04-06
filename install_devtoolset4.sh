#!/bin/bash -e
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-4-gcc-c++ devtoolset-4-binutils; yum clean all -y
