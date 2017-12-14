FROM python:3.6-slim-stretch
MAINTAINER Holger Schinzel <holger@dash.org>

RUN apt-get update && \
    apt-get install git curl mysql-client cython3 -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SENTINEL_COMMIT=01ab29702cebb68503dac6f1cda5d33f327ca492

RUN git clone https://github.com/dashpay/sentinel.git /sentinel && \
    cd /sentinel && \
    git checkout $SENTINEL_COMMIT && \
    rm sentinel.conf && \
    rm -rf .git && \
    pip install -r requirements.txt && exit 0

ENV HOME /sentinel
WORKDIR /sentinel

ADD run.sh /

CMD /run.sh
