#!/bin/bash

rm -f packer_virtualbox-iso_virtualbox.box 
packer build -only virtualbox-iso packer.json
vagrant box remove tiny-ubuntu 
vagrant box add tiny-ubuntu packer_virtualbox-iso_virtualbox.box
