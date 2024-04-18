FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3 \
        python-is-python3 \
        python3-dev \
        python3-pip \
        mariadb-client \
        mariadb-server \
        redis-server \
        software-properties-common 

