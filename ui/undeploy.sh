#!/usr/bin/env bash
printf "\n\n######## undeploy ########\n"

DASHBOARD_PROJECT=odh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc project ${DASHBOARD_PROJECT} 2> /dev/null
oc project

oc delete -k "${DIR}/odh-dashboard"
