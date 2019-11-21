#!/bin/bash

set -e

BRANCH=${1:-master}
VERSION=${1:-latest}

curl -L -o devfiles/codewind/devfile.yaml https://raw.githubusercontent.com/eclipse/codewind-che-plugin/$BRANCH/devfiles/$VERSION/devfile.yaml
