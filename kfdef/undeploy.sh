#!/usr/bin/env bash
printf "\n\n######## undeploy ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc delete kfdef opendatahub -n odh
oc delete project odh
