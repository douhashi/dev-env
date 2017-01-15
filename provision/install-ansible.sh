#!/usr/bin/env bash

if type ansible >/dev/null 2>&1; then
  echo "Ansible installed!"
else
  apt-get install -y --force-yes -qq software-properties-common
  add-apt-repository -y ppa:ansible/ansible
  apt-get update

  echo 'Instaling Ansible...'
  apt-get install -y --force-yes -qq ansible

fi

echo 'Installing requirements...'
ansible-galaxy install -r /vagrant/provision/requirements.yml
