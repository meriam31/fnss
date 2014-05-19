#!/bin/sh
#
# This script automatically downloads and installs the FNSS core
# library along with all its dependencies to be used with
# Python 2.7
#
# This script has been tested only on Ubuntu version 12.04+
#
# If this script is run on Ubuntu 14.04, it also install all dependencies
# for running FNSS with Python 3.

# Makes sure all packages installed are up-to-date
sudo apt-get update
sudo apt-get upgrade

# Install all dependencies available on Ubuntu package repository
sudo apt-get install python python-pip python-setuptools python-numpy python-scipy python-networkx python-mako python-nose

# Install other optional dependencies not available on Ubuntu package repository
sudo pip install sphinx numpydoc

# Install FNSS core library
sudo pip install -U fnss

# Install FNSS and all dependencies for Python 3 (only on Ubuntu 14.04)
# Note: NetworkX must be installed via pip3 instead of Aptitude because of a
# bug that crashes the installation of python3-network apt package if
# python-networkx is installed
if type "lsb_release" > /dev/null; then 
	if [type "lsb_release" > /dev/null -a `lsb_release -r | awk '{print $2}'` = "14.04"]; then
		sudo apt-get install python3-pip python3-setuptools python3-numpy python3-scipy python3-mako python3-nose
		sudo pip3 install -U sphinx numpydoc networkx fnss
	fi
fi
