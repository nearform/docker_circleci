# Docker CircleCI s2i Build image

Based on the CircleCI Node image this adds tools to build docker images.

Included tools:
* node.js
* aws-cli
* jq
* docker-squash
* source2image
* skopeo
* golang
* build-essentials

This image is designed to be used by CircleCI as a build image.