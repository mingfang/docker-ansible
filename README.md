# docker-ansible
Runs Ansible Inside Docker

```
alias ansible='docker run -v `pwd`:/docker -w /docker --rm -i ansible ansible'
alias ansible-galaxy='docker run -v `pwd`:/docker -w /docker --rm -it ansible ansible-galaxy'
alias ansible-playbook='docker run --net=host -v `pwd`:/docker -w /docker --rm -it ansible ansible-playbook'
alias ansible-vault='docker run -v `pwd`:/docker -w /docker --rm -it ansible ansible-vault'
```
