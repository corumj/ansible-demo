#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"
ansible-galaxy collection install -r collections/requirements.yml --upgrade
ansible-playbook aws-tower-setup.yml 
popd