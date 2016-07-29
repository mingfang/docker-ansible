FROM ubuntu:14.04
  
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    TERM=xterm
RUN locale-gen en_US en_US.UTF-8
RUN echo "export PS1='\e[1;31m\]\u@\h:\w\\$\[\e[0m\] '" >> /root/.bashrc
RUN apt-get update

# Runit
RUN apt-get install -y runit 
CMD export > /etc/envvars && /usr/sbin/runsvdir-start
RUN echo 'export > /etc/envvars' >> /root/.bashrc

# Utilities
RUN apt-get install -y vim less net-tools inetutils-ping wget curl git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common jq psmisc

#Ansible
RUN apt-get install -y libssl-dev libffi-dev python-dev python-pip
RUN pip install --upgrade setuptools
RUN pip install httplib2
RUN pip install ansible

#Kubectl
RUN cd /usr/bin && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.3.3/bin/linux/amd64/kubectl && \
    chmod +x kubectl

# Add runit services
ARG BUILD_INFO
LABEL BUILD_INFO=$BUILD_INFO
