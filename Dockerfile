FROM ubuntu:14.04
 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN locale-gen en_US en_US.UTF-8
ENV LANG en_US.UTF-8

#Utilities
RUN apt-get install -y vim less net-tools inetutils-ping wget curl git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common jq

#Ansible
RUN apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

#Kubectl
RUN cd /usr/bin && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.1.7/bin/linux/amd64/kubectl && \
    chmod +x kubectl
