#!/bin/sh

set -e

echo "repos $1"
echo "username $2"
echo "password $3"
echo "registry $4"
echo "::set-output name=args::success2"

REPOS="$1"
USERNAME="$2"
PASSWORD="$3"
REGISTRY="$4"

echo "current working directory is " $PWD
#cd ../../
cd

echo ${GITHUB_REPOSITORY}
echo ${GITHUB_SECRET}
ls

# if [ -z "${IMPORT}" ]; then
#   IMPORT="${GITHUB_REPOSITORY}"
# fi
# WORKDIR="${GOPATH}/src/github.com/${IMPORT}"

# # PROJECT_PATH specifies the subdirectory in the working directory that the Go project is
# if [ -z "${PROJECT_PATH}" ]; then
#   PROJECT_PATH="."
# fi

# # Go can only find dependencies if they're under $GOPATH/src.
# # GitHub Actions mounts your repository outside of $GOPATH.
# # So symlink the repository into $GOPATH, and then cd to it.
# mkdir -p "$(dirname "${WORKDIR}")"
# ln -s "${PWD}" "${WORKDIR}"

echo "${PASSWORD}" | docker login -u ${USERNAME} --password-stdin ${REGISTRY}

for repo in ${REPOS}; do
    echo "Running $repo"
    cd
    cd "${repo}"
    ls
    
done