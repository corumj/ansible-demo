#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"

ansible-playbook -i aws_ec2.yml stop.yml 

popd