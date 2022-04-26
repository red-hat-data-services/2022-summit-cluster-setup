#!/usr/bin/env bash
printf "\n\n######## create serving example ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc apply -k "${DIR}/example"

