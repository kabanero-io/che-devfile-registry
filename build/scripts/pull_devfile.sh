#!/bin/bash

set -e

BRANCH=${1:-master}
VERSION=${1:-latest}

DEVFILE=https://raw.githubusercontent.com/eclipse/codewind-che-plugin/$BRANCH/devfiles/$VERSION/devfile.yaml

echo "Pulling down $DEVFILE"

curl -L -o devfiles/codewind/devfile.yaml $DEVFILE
