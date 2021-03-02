#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"

ansible-playbook refresh_AWS_cred.yml 

popd