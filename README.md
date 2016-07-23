# Build Slaves

This repo contains a series of Jenkins JNLP build slave images created
to handle an Ansible-based deployment setup that deploys to Google 
Container Engine. 

The images were broken up to facilitate re-use.

## jnlp-slave

Tag | Description
----| -----------
2.59| v. 2.59 of the Jenkins report jar

This image is based off of the jenkinsci/jnlp-slave image on Docker Hub.
It's slightly modified to simplify versioning the remoting jar and 
enhances the entrypoint script to better support passing different
commands in.

## docker-slave

Tag   | Description
------| -----------
1.11.2| v 1.11.2 of Docker Engine

Based off of `ceroic/jnlp-slave:2.59`. 

Installs docker in order to support docker in docker style builds.

## kubectl-slave

Tag   | Description
------| -----------
latest| At the moment, tagged versions of gcloud and kubectl aren't supported.

Based off of `ceroic/docker-slave:1.11.2`.

Installs the gcloud sdk and kubectl.

## ansible-slave

Tag   | Description
------| -----------
latest| At the moment, tagged versions of ansible aren't supported.

Based off of `ceroic/kubectl-slave:latest`.

Installs python and ansible, including requirements to support gcloud
operations.
