# Ansible Demo Environment for Red Hat Open Environments 
This is to help provide a quick, single stop shop for Ansible demo's using the new Red Hat Open Environments.  Please don't use any of these playbooks in production without lots of review.  

This demo environment incorporates a variety of playbooks from other Git projects and is meant to be somewhat modular so it can grow with time.  

# Demo includes: * some or all of this might not be implemented yet *
  * ServiceNow (content from: https://github.com/corumj/ansible-servicenow-demo/tree/platform )
    * Custom Credentials
    * Tower API 
    * Compliance (basic because we don't have all day in a demo to wait for a CIS standard to scan)
  * Linux (coming soon, hopefully)
    * Config Management 
  * Windows 
    * Config Management 
      * Windows Features on and off
      * Compliance checking 
      * Multi-site IIS config 
      * Installing packages with Chocolatey
  * Generic talking points
    * Using collections and roles
    * AWS Dynamic Inventory & Provisioning
  

# Requirements:
  * Red Hat Open Environments "AWS Blank Open Environment" provisioning email with AWS keys and top level domain.
  * Download a copy of the Bundled AAP 2.1 installer and name it aap.tar.gz in the root folder of this project.  
  * SSH keys at ~/.ssh (you can update the `group_vars/all.yml` file with the path of the key you want to use, by default it's just `~/.ssh/id_rsa`)
  * Manifest file for registering Controller, needs to be downloaded and placed in this repo's root folder as `manifest.zip`  See obtaining a subscription manifest for Tower [here](https://docs.ansible.com/ansible-tower/latest/html/userguide/import_license.html#obtaining-a-subscriptions-manifest)
  * Python modules on your local machine running Ansible Core:
    * boto/boto3 
  * Ansible-core 2.11.x
  * An access.redhat.com offline token 
    - Create a Red Hat API token at https://access.redhat.com/management/api 
  * An Automation Hub offline token
    - Create a token for Automation Hub at https://console.redhat.com/ansible/automation-hub/token
    
# Setup
1. Update your boto profile in `~/.aws/credentials`.  Detailed instructions can be found here, https://github.com/ansible/workshops/blob/devel/docs/setup.md but it should look approximately like this:
```ini
[default]
aws_access_key_id = ABCDEFGHIJKLMNOP
aws_secret_access_key = ABCDEFGHIJKLMNOP/ABCDEFGHIJKLMNOP
```

2. Copy `extra_vars_template.yml` to `extra_vars.yml` and populate the variables.  This will have secret information so `extra_vars.yml` is in the `.gitignore` file - you shouldn't have to revisit that file unless you usernames or tokens change.  

3. Run `./setup.sh`.  For whatever reason it currently doesn't work without a Become password - this needs to be your localhost password, it will install the collections needed and proceed to provision and install AAP2 at `https://ansible.{{ top_level_domain }}` where `top_level_domain` comes from the Open Environments email and is populated in `extra_vars.yml`.

# Utilities to make your life easier
1. `./start.sh` and `./stop.sh` will start and stop the Controller server, and ONLY the Controller server in AWS.
3. `ansible-playbook aws-tower-teardown.yml` can be run if you are done using Controller and won't be returning to it.  Bear in mind that the setup cannot be run ad naseum because Let's Encrypt will tell you to pound sand if you request the same certificate more than 5 times a month, so completely deprovisioning should be rare, keep the server off when you are not using it.  
> :warning: **Servers provisioned through the built in provisioning template in this Demo are not removed with the `aws-tower-teardown.yml` you must run the built-in deprovisioning job template to get rid of those before shutting down or removing Tower.