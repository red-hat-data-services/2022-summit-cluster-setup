#!/usr/bin/env bash
printf "\n\n######## undeploy ########\n"

SERVING_PROJECT=modelmesh-serving

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc project ${SERVING_PROJECT} 2> /dev/null
oc project

pushd "${DIR}/modelmesh-serving" || exit
./scripts/delete.sh --namespace $SERVING_PROJECT
popd || exit
