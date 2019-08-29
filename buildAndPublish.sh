#!/bin/bash

# Decide name and version
VERSION=$TRAVIS_TAG
NAME="testfairy/testfairy-connect"
TAG="${NAME}:${VERSION}"

# Build image
set -x
docker build . \
    --no-cache \
    -t $TAG \
    --build-arg version=$VERSION \

# TODO : test if built image works

# Don't push images if not a tagged github release, simply finalize CI
echo "Current Tag: ${TRAVIS_TAG}"
if [ -z "$TRAVIS_TAG" ];then
    exit 0
fi

# Tag image as latest
IMAGE_ID=$(docker images $TAG --format "{{.ID}}")
docker tag $IMAGE_ID "${NAME}:latest"

# Login to docker hub
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Push each tag
for T in $(sudo docker images vaidik/etcd --format "{{.Tag}}");
do
    docker push "${NAME}:${T}"
done

# Set readme path to sync
README_FILEPATH="./README.md"

# Acquire a token for the Docker Hub API
echo "Acquiring token"
LOGIN_PAYLOAD="{\"username\": \"${DOCKER_USERNAME}\", \"password\": \"${DOCKER_PASSWORD}\"}"
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d ${LOGIN_PAYLOAD} https://hub.docker.com/v2/users/login/ | jq -r .token)

# Send a PATCH request to update the description of the repository
echo "Sending PATCH request"
REPO_URL="https://hub.docker.com/v2/repositories/${NAME}/"
RESPONSE_CODE=$(curl -s --write-out %{response_code} --output /dev/null -H "Authorization: JWT ${TOKEN}" -X PATCH --data-urlencode full_description@${README_FILEPATH} ${REPO_URL})
echo "Received response code: ${RESPONSE_CODE}"

# if [ $RESPONSE_CODE -eq 200 ]; then
#   exit 0
# else
#   exit 1
# fi
