FROM phusion/baseimage:0.9.18
MAINTAINER Holger Schinzel <holger@dash.org>

ARG USER_ID
ARG GROUP_ID

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 44AFED48 && \
    echo "deb http://ppa.launchpad.net/dash.org/dash/ubuntu trusty main" > /etc/apt/sources.list.d/dash.list

RUN apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /sentinel