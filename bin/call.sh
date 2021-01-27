#!/bin/bash

set -eu
set -o pipefail 

KSVC_NAME=${1:-'greeter'}

KSVC_HOST=$(oc get rt $KSVC_NAME -o yaml | yq read - 'status.url')

if [ $# -le 1 ]
then
  http GET "$KSVC_HOST"
else
  echo "$2" | http --body POST "$KSVC_HOST"
fi

exit_err() {
   echo >&2 "${1}"
   exit 1
}

exit 0
