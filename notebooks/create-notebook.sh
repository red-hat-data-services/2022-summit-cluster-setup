#!/usr/bin/env bash
printf "\n\n######## create notebook ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc apply -k "${DIR}/odh-notebooks"

echo https://ephemeral-nb-server-cchase-project.apps.summit-demo.d7se.p1.openshiftapps.com/notebook/cchase-project/ephemeral-nb-server/lab
