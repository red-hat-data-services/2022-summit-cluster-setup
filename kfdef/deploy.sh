#!/usr/bin/env bash
printf "\n\n######## deploy ########\n"

oc apply -k "${DIR}/example"
