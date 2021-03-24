# ansible-jenkins-cluster
Repo for the setting up Jenkins cluster using Ansible

### Instructions for running this Playbook to setup Jenkins cluster
  1. Update the Host IP addresses in inventories/dev/hosts file
  2. Validate if the servers are accessible for ansible to run the scripts
    ```
    ansible -m ping
    ```
    For local instance specify 'ansible_connection=local' along with host IP address
  3. Use command 'ansible-playbook jenkins.yml --check' to run the playbook in dry run mode




## Jenkins Setup Options
  1. Using Molecule- For Testing purpose
  2. Using Vagrant- For Local
  2. Using Ansible with real Instances


### Using Molecule
  With the molecule.yml file, we have defined the platforms/instances need to run the Ansible roles. Use the below command to start with instance creation and then setting the Jenkins using the Ansible roles provided in Converge.yml file

  Reference link to install all required modules for working with Ansible and molecule
  https://www.trustedsec.com/blog/automation-testing-with-ansible-molecule-and-vagrant/

  ```
  molecule converge
  ```

  To login to any of the instance created using molecule can logged using the below Command
  ```
  molecule login

  or

  molecule login --host jenkins-master
  ```

### Using Vagrant
  #### Pre-Requisite
      1. Install Vagrant
      2. Install VirtualBox

## Getting Started
This Repo has a Vagrant File which will be helpful to spin up Virtual Instances to play with Ansible Playbooks

The vagrant file has the box name which can be choosen from this [link](https://app.vagrantup.com/boxes/search)

### Starting the Virtual Instances

```
vagrant up
```

For updating the existing Vagrant boxes

```
vagrant box update
```

With this step, you should see 2 virtual instances (centos-7 instance & Windows2012R2 instance) created in your VirtualBox

You should be able to access both these instances using default Vagrant credentials. Linux instances through SSH & windows instances with the Vagrant/Administrator logon from VirtualBox

To get started, you should be able to install Ansible in the Linux/Centos instance.

### Setting up Ansible Control Center

Login to the Linux/Centos instance with the below command and provide the default password when prompted
```
ssh vagrant@192.168.10.20
```

Note: If on VPN connection, the direct connection to the connection can be done using this below Command
```
ssh -p 2222 vagrant@localhost
```

Installing the Pre-requisites and Ansible. NOTE: sudo is root user and yum is package manager for Centos

```
sudo yum install epel-release
sudo yum install python-pip
sudo pip install --upgrade pip
sudo pip install markupsafe
sudo pip install xmltodict
sudo pip install pywinrm
sudo pip install ansible
sudo yum install sshpass
```

Verify your Ansible installation

```
ansible --version
```

Uploading the Ansible playbook and files to Control Server

```
vagrant up --provision
```

Running playbooks

```
ansible-playbook jenkins.yml
```

To override the variable from the command line while executing use the below Command
Providing just user credentials
```
ansible-playbook  jenkins.yml --ask-vault-pass -e "ansible_user=USER ansible_password=USER"
```
Providing hosts as input parameter when hosts is accepted as a variable
```
ansible-playbook  jenkins.yml --ask-vault-pass -e "hosts=jenkins-master ansible_user=USER ansible_password=USER"
```
