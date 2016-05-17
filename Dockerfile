FROM jenkinsci/jnlp-slave:latest
MAINTAINER Ceroic <ops@ceroic.com>

# Base image sets user to jenkins, switch back to root for this.
USER root

# Install Docker
RUN \
    # apt-get purge lxc-docker* && \
    # apt-get purge docker.io* && \
    apt-get update && \
    apt-get install -y apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo 'deb https://apt.dockerproject.org/repo debian-jessie main' | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-cache policy docker-engine && \
    apt-get install -y docker-engine=1.9.1-0~jessie && \
    gpasswd -a jenkins docker

# Install Google Cloud SDK
RUN apt-get install -y lsb-release
RUN \
    echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk
    
# Switch Back to jenkins
# USER jenkins
