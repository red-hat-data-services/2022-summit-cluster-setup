#!/usr/bin/env bash
printf "\n\n######## undeploy ########\n"

NOTEBOOK_PROJECT=notebook-controller-system

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc delete -k "${DIR}/odh-notebooks"
oc delete notebooks.kubeflow.org --all --all-namespaces #make sure any other notebooks are deleted before deleting the CRD
oc delete -k "${DIR}/notebook-controller/config/overlays/standalone"
