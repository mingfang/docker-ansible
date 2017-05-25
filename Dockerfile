FROM ubuntu:16.04 as base

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    TERM=xterm
RUN echo "export > /etc/envvars" >> /root/.bashrc && \
    echo "export PS1='\e[1;31m\]\u@\h:\w\\$\[\e[0m\] '" | tee -a /root/.bashrc /etc/bash.bashrc && \
    echo "alias tcurrent='tail /var/log/*/current -f'" | tee -a /root/.bashrc /etc/bash.bashrc

RUN apt-get update
RUN apt-get install -y locales && locale-gen en_US en_US.UTF-8

# Runit
RUN apt-get install -y --no-install-recommends runit
CMD export > /etc/envvars && /usr/sbin/runsvdir-start

# Utilities
RUN apt-get install -y --no-install-recommends vim less net-tools inetutils-ping wget curl git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common jq psmisc iproute python ssh rsync gettext-base

#Ansible
RUN apt-get install -y libssl-dev libffi-dev python-dev python-pip
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install httplib2
RUN pip install jmespath
RUN pip install ansible

#AWS
RUN apt-get install -y groff
RUN pip install awscli
RUN pip install aws-shell

#Kubectl
RUN cd /usr/bin && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl && \
    chmod +x kubectl

# Add runit services
ARG BUILD_INFO
LABEL BUILD_INFO=$BUILD_INFO
