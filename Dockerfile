FROM phusion/baseimage:0.9.18
MAINTAINER Holger Schinzel <holger@dash.org>

ARG USER_ID
ARG GROUP_ID

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 44AFED48 && \
    echo "deb http://ppa.launchpad.net/dash.org/dash/ubuntu trusty main" > /etc/apt/sources.list.d/dash.list && \
    apt-get update && \
    apt-get install git curl mysql-client python-dev python-pytest python-pip -y && \
    git clone https://github.com/nmarley/sentinel.git /sentinel && \
    cd /sentinel && \
    git checkout 9825a93d6e992b23f10afc2f1cd9707435e5e178 && \
    pip install cython && \
    pip install -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /sentinel