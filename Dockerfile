FROM ubuntu:16.04

# Install basic apps
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
RUN apt-get update && apt-get install -y --fix-missing \
    vim \
    nano \
    python-dev \
    python-pip \
    build-essential
RUN apt-get install -y git

# Add user
RUN adduser --disabled-password --gecos "" ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD ./bashrc /home/ubuntu/.bashrc
ADD ./bashrc /root/.bashrc

CMD /bin/bash
