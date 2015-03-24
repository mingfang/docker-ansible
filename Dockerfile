FROM ubuntu:14.04
 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN locale-gen en_US en_US.UTF-8
ENV LANG en_US.UTF-8

#Utilities
RUN apt-get install -y software-properties-common

RUN apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible
