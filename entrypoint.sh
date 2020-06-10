#!/bin/sh

set -e

REPOS="$1"
USERNAME="$2"
PASSWORD="$3"
REGISTRY="$4"

echo "current working directory is " $PWD
REPO_ROOT_DIR="$PWD"


echo "${PASSWORD}" | docker login ${REGISTRY} -u ${USERNAME} --password-stdin

for repo in ${REPOS}; do
    echo "Running on $repo"
    cd "${REPO_ROOT_DIR}"
    cd "${repo}"
    # Do not do this for GO
    cp "${REPO_ROOT_DIR}/libs/captron_java_lib" . -r

    TAG="${GITHUB_REF##*/}-$(echo ${GITHUB_SHA} | cut -c1-8)"

    # Change path
    docker build -t "${REGISTRY}/liminaab/monorepo/${repo/apps\//}:${TAG}" .

    docker push "${REGISTRY}/liminaab/monorepo/${repo/apps\//}:${TAG}"
done