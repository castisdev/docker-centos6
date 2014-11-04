#!/bin/sh -e
 
cd ~ 
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python get-pip.py
pip install gcovr
pip install cpplint
rm -rf get-pip.py


