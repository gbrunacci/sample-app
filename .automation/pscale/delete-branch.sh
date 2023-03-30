#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

DELETE_CMD="pscale branch delete $DB_NAME $BRANCH_NAME --org $ORG_NAME --force"

echo "Deleting branch $BRANCH_NAME"
DELETE_CMD_OUTPUT=$($DELETE_CMD)

# check return code, if not 0 then error
if [ $? -ne 0 ]; then
    echo "Error: $DELETE_CMD returned non-zero exit code $?. See output below."
    echo $DELETE_CMD_OUTPUT
    exit 1
fi

echo $DELETE_CMD_OUTPUT
