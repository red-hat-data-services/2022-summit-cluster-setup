#!/usr/bin/env bash
printf "\n\n######## deploy ########\n"

NOTEBOOK_PROJECT=notebook-controller-system

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc create -k "${DIR}/notebook-controller/config/overlays/standalone"
oc apply -k "${DIR}/odh-notebooks"
