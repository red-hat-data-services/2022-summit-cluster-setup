#!/usr/bin/env bash
printf "\n\n######## deploy ########\n"

DASHBOARD_PROJECT=odh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc project ${DASHBOARD_PROJECT} 2> /dev/null || oc new-project ${DASHBOARD_PROJECT}
oc project

oc apply -k "${DIR}/odh-dashboard"
