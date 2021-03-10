# Ansible Demo Environment
This is to help provide a quick, single stop shop for Ansible demo's.  Please don't use any of these playbooks in production without lots of review - they were not meant to be to a production spec.  

This demo environment incorporates a variety of playbooks from other Git projects and is meant to be somewhat modular so it can grow with time.  

# Demo includes: * some or all of this might not be implemented yet *
  * ServiceNow (content from: https://github.com/corumj/ansible-servicenow-demo/tree/platform )
    * Custom Credentials
    * Tower API 
    * Compliance (basic because we don't have all day in a demo to wait for a CIS standard to scan)
  * Linux (coming soon, hopefully)
    * Config Management 
      * Nginx Install
      * Templating Nginx Config file
      * Patching 
      * Templating SUDOERS file
  * Windows
    * Config Management (coming soon)
      * Windows Features on and off
      * Compliance checking 
      * Multi-site IIS config 
      * Installing packages with Chocolatey
    * Active Directory Setup
    * using win_dsc to take advantage of PowerShell DSC's.  
    * Configuring LDAP and pulling AD groups into Tower to manage users (coming soon)
  * Generic talking points
    * Using collections and roles
    * AWS Dynamic Inventory & Provisioning
  

# Requirements:
  * AWS Account access with a boto profile (specify your profile name in `group_vars/all.yml`, default is `saml`)
  * SSH keys at ~/.ssh (you can update the `group_vars/all.yml` file with the path of the key you want to use, by default it's just ~/.ssh/id_rsa)
  * Manifest file for registering Tower, needs to be downloaded and placed in this repo's files folder `files/manifest.zip`  See obtaining a subscription manifest for Tower [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/import_license.html#obtaining-a-subscriptions-manifest)
  * Python modules on your local machine running Ansible Core:
    * boto/boto3 
  * Ansible-core 2.9.x 
    
# Setup
1. Make sure your boto profile is refreshed and you have updated *aws_profile* in `group_vars/all.yml` to match your profile name in `~/.aws/credentials`.  The default value uses the saml profile, which is what our Red Hat IT folks have established as the standard.  You shouldn't need to make any changes if you are using their awesome aws-saml.py script (though I do recommend running it with `--session-duration 14400`, so you get 4 hours out of a token and not just 1 hour).  Also verify that *aws_region* in the group vars file matches whats in your saml profile - this will matter later on when provisioning servers for the demo.  It can be edited in both places without causing errors, but bear in mind if you use a region other than us-east-1 you are responsible for finding the correct AMI's for RHEL and Windows Server.  
2. Run `./setup.sh`.  It will install the required collections for setup and ask you to confirm an initial Ansible Tower administrator password, and then spin up your Tower Environment.  Expect this to take around 15-30 minutes. 

# Utilities to make your life easier
1. `./start.sh` and `./stop.sh` will start and stop the Tower server, and ONLY the Tower server in AWS.
2. `./refresh_credential.sh` can be run after refreshing your saml AWS profile to update the AWS credential in Tower
3. `ansible-playbook aws-tower-teardown.yml` can be run if you are done using Tower and won't be returning to it.  Bear in mind that the setup cannot be run ad naseum because Let's Encrypt will tell you to pound sand if you request the same certificate more than 5 times a month, so completely deprovisioning should be rare, keep the server off when you are not using it.  
> :warning: **Servers provisioned through the built in provisioning template in this Demo are not removed with the `aws-tower-teardown.yml` you must run the built-in deprovisioning job template to get rid of those before shutting down or removing Tower.