#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"

ansible-playbook -i aws_ec2.yml -e @extra_vars.yml aws-controller-teardown.yml

popd