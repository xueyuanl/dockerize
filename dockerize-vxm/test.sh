#!/bin/bash

dep_ubuntu="sshpass"

for pkg in $dep_ubuntu; do
	dpkg -s "$package" >/dev/null 2>&1 
	if [ "$?" != 0 ]; then
		apt-get install $pkg >/dev/null 2>&1
	fi
done
