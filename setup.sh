#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"
export AWS_PROFILE=saml
ansible-galaxy collection install -r collections/requirements.yml
ansible-playbook aws-setup.yml 
popd