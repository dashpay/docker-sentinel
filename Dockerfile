FROM python:3.7-slim-buster
MAINTAINER Holger Schinzel <holger@dash.org>

RUN apt-get update && \
    apt-get install git curl -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/dashpay/sentinel.git /sentinel && \
    cd /sentinel && \
    rm sentinel.conf && \
    rm -rf .git && \
    pip install -r requirements.txt && exit 0

ENV HOME /sentinel
WORKDIR /sentinel

ADD run.sh /

CMD /run.sh
