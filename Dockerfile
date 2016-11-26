FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    TERM=xterm
RUN locale-gen en_US en_US.UTF-8
RUN echo "export PS1='\e[1;31m\]\u@\h:\w\\$\[\e[0m\] '" >> /root/.bashrc
RUN echo "export PS1='\e[1;31m\]\u@\h:\w\\$\[\e[0m\] '" >> /etc/bash.bashrc
RUN apt-get update

# Runit
RUN apt-get install -y --no-install-recommends runit
CMD export > /etc/envvars && /usr/sbin/runsvdir-start
RUN echo 'export > /etc/envvars' >> /root/.bashrc

# Utilities
RUN apt-get install -y --no-install-recommends vim less net-tools inetutils-ping wget curl git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common jq psmisc iproute python ssh

#Ansible
RUN apt-get install -y libssl-dev libffi-dev python-dev python-pip
RUN pip install --upgrade setuptools
RUN pip install httplib2
RUN pip install boto
RUN pip install cryptography
RUN pip install ansible

#Kubectl
RUN cd /usr/bin && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.4.6/bin/linux/amd64/kubectl && \
    chmod +x kubectl

RUN wget https://raw.github.com/ansible/ansible/devel/contrib/inventory/ec2.py
RUN chmod +x ec2.py

# Add runit services
ARG BUILD_INFO
LABEL BUILD_INFO=$BUILD_INFO
