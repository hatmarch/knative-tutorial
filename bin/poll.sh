#!/bin/bash
set -eu
set -o pipefail

trap '{ echo "" ; exit 1; }' INT

KSVC_NAME=${1:-'greeter'}

KSVC_HOST=$(kubectl get rt $KSVC_NAME -o yaml | yq read - 'status.url')

while true
do
  curl "$KSVC_HOST"
  sleep .5
done

exit_err() {
   echo >&2 "${1}"
   exit 1
}

exit 0
