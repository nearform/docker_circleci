FROM circleci/node:8
LABEL maintainer alex.knol@nearform.com

ENV S2I_VERSION v1.1.7-226afa1

RUN \
    cd ~ && \
    wget https://github.com/openshift/source-to-image/releases/download/v1.1.7/source-to-image-${S2I_VERSION}-linux-amd64.tar.gz && \
    tar zxvf source-to-image-${S2I_VERSION}-linux-amd64.tar.gz && \
    sudo mv ./s2i /usr/local/bin && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    sudo apt-get update -qq && \
    sudo apt-get install -qqy python-dev python-setuptools jq && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo easy_install pip && \
    sudo pip install docker-squash && \
    sudo pip install --user python-dateutil && \
    sudo pip install --user --no-deps s3cmd && \
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws