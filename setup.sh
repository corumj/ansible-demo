#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"
ansible-galaxy collection install -r collections/requirements.yml --force
ansible-playbook -i aws_ec2.yml aws-controller-setup.yml -e @extra_vars.yml
popd