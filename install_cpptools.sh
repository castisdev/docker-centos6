#!/bin/sh -e
set -x #echo on

cd ~
yum install -y python-pip; yum clean all -y
pip install gcovr cpplint
