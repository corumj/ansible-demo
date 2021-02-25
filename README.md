# Ansible Demo Environment

# Demo includes:
  * Using collections and roles

# Requirements:
  * AWS Account access with a boto profile (specify your profile name in `group_vars/all.yml`)
  * SSH keys at ~/.ssh (you can update the `group_vars/all.yml` file with the location of the key you want to use, by default it's just ~/.ssh/id_rsa)
  * Manifest file for registering, needs to be downloaded and places in this repo's files folder `files/manifest.zip`  See obtaining a subscription manifest for Tower [here](manifest_tower_20210224T191611Z.zip)
