#!/usr/bin/env bash
printf "\n\n######## undeploy ########\n"

SERVING_PROJECT=modelmesh-serving

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc delete project odh
