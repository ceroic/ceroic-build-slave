FROM tehranian/dind-jenkins-slave:latest
MAINTAINER Ceroic <ops@ceroic.com>

# Install some basics
RUN \
    apt-get update && \
    apt-get install -y build-essential curl git python-pip python-dev python-software-properties software-properties-common

# Install virtual env an aws cli
RUN pip install virtualenv awscli

# Install Node. At the moment we aren't concerned w/ versioning node
# since we only use it for client asset building

# Note the new setup script name for Node.js v0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

# Then install with:
RUN sudo apt-get install -y nodejs

# Install Bower
RUN npm install -g bower

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
