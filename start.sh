#!/bin/bash

pushd "$( dirname "${BASH_SOURCE[0]}" )"

ansible-playbook start.yml 

popd