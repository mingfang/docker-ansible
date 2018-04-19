# docker-ansible

Runs Ansible inside Docker.

## Building this container

```
mkdir "${HOME}/github.com/mingfang"
cd "${HOME}/github.com/mingfang"
git clone git@github.com:mingfang/docker-ansible.git
sudo docker build docker-ansible -t mingfang/ansible
source docker-ansible/alias 
```

Optionally add the aliases to your .bashrc:

```
cat ./alias >> "${HOME}/.bashrc"
```

## Running Ansible

Use these commands, which should be aliases to this container:

```
ansible
ansible-galaxy
ansible-playbook
ansible-vault
```
