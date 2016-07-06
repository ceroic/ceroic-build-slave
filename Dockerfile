FROM jenkinsci/jnlp-slave:latest
MAINTAINER Ceroic <ops@ceroic.com>

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

# Base image sets user to jenkins, switch back to root for this.
USER root

# Install Docker
RUN \
    apt-get update && \
    apt-get install -y apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo 'deb https://apt.dockerproject.org/repo debian-jessie main' | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-cache policy docker-engine && \
    apt-get install -y docker-engine=1.9.1-0~jessie && \
    gpasswd -a jenkins docker

# Install Google Cloud SDK
RUN apt-get update -y
RUN apt-get install -y jq
RUN curl https://sdk.cloud.google.com | bash && mv google-cloud-sdk /opt
RUN gcloud components install kubectl

# Install helm
RUN curl -s https://get.helm.sh | bash
RUN mv helmc /usr/bin
