# Ansible Demo Environment

# Demo includes:
  * Using collections and roles
  * AWS Inventory & Provisioning
  * Config Management
    * Nginx Install
    * Templating Nginx Config file
    * Patching 
    * Templating SUDOERS file
  

# Requirements:
  * AWS Account access with a boto profile (specify your profile name in `group_vars/all.yml`, default is `saml`)
  * SSH keys at ~/.ssh (you can update the `group_vars/all.yml` file with the path of the key you want to use, by default it's just ~/.ssh/id_rsa)
  * Manifest file for registering Tower, needs to be downloaded and placed in this repo's files folder `files/manifest.zip`  See obtaining a subscription manifest for Tower [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/import_license.html#obtaining-a-subscriptions-manifest)
  * Python modules:
    * boto/boto3 
  * Ansible-core 2.9.x 
    
