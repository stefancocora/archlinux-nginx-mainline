#!/bin/bash

# VERSION=${1:-0.0.1}
VERSION=${1}
VERSION_PREFIX='v1.11'
IMAGENAME='stefancocora/archlinux-nginx-mainline'

function usage() {

  echo "usage:"
  echo ""
  echo "$0 <version_number>"
  echo "example:"
  echo "$0 v1.2.3"
  echo ""
}

function build() {
  LOCAL_VERSION=$1
  echo "will build version: ${LOCAL_VERSION}"
  docker build --no-cache -t ${IMAGENAME}:${LOCAL_VERSION} .
}

case ${VERSION} in
    ${VERSION_PREFIX}.*)
    build ${VERSION}
    shift
    ;;
    -h)
    usage
    exit 1
    shift
    ;;
    --help)
    usage
    exit 1
    shift
    ;;
    *)
    usage
    exit 1
    shift
    ;;
esac
