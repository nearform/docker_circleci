FROM circleci/node:8
LABEL maintainer alex.knol@nearform.com

RUN \
    cd ~ && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    sudo apt-get update -qq && \
    sudo apt-get install -qqy python-dev jq && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    pip install docker-squash