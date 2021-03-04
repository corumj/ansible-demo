# Ansible Demo Environment
This is to help provide a quick, single stop shop for Ansible demo's.  Please don't use any of these playbooks in production without lots of review - they were not meant to be to a production spec.  

It incorporates a variety of playbooks from other Git projects and is meant to be somewhat modular so it can grow with time.  

# Demo includes: * some or all of this might not be implemented yet *
  * ServiceNow
    * Custom Credentials
    * Tower API 
    * Compliance (basic because we don't have all day in a demo to wait for a CIS standard to scan)
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
    
# Setup
1. Make sure your boto profile is refreshed and you have updated *aws_profile* in `group_vars/all.yml` to match your profile name in ~/.aws/credentials.  The default value uses the saml profile.  Also verify that *aws_region* in the group vars file matches whats in your saml profile - this will matter later on when provisioning servers for the demo.
2. Run `./setup.sh`.  It will ask you to confirm an initial Ansible Tower administrator password, and then spin up your Tower Environment.  Expect this to take around 15-30 minutes.  