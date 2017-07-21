#!/bin/bash

set -e
# Install vagrant user key
mkdir ~vagrant/.ssh
chmod 700 ~vagrant/.ssh
cp /tmp/files/vagrant.authorized_keys ~vagrant/.ssh/authorized_keys
chmod 600 ~vagrant/.ssh/authorized_keys
chown -R vagrant ~vagrant/.ssh

# Install guest additions 
apt-get -q install -y virtualbox-guest-dkms
apt-get -q install -y virtualbox-guest-utils

# Vagrant user setup
# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Install packages
apt-get  -q install -y tmux
apt-get  -q install -y vim
apt-get  -q install -y curl wget
apt-get  -q install -y git
apt-get  -q install -y python
