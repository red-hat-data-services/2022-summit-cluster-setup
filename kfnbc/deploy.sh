#!/usr/bin/env bash
printf "\n\n######## deploy ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc project ${KFNBC_PROJECT} 2> /dev/null || oc new-project ${KFNBC_PROJECT}
oc project

