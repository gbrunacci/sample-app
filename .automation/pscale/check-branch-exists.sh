#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

echo "Checking if branch $BRANCH_NAME exists and is ready"

LIST_CMD="pscale branch list $DB_NAME --org $ORG_NAME --format json"
LIST_CMD_OUTPUT=$($LIST_CMD)

if [ $? -ne 0 ]; then
    echo "Error: $LIST_CMD returned non-zero exit code $?. See output below."
    echo $LIST_CMD_OUTPUT
    exit 1
fi

echo $LIST_CMD_OUTPUT | jq .

PS_BRANCH_READY=$(echo $RAW_OUTPUT | jq ".[] | select(.name == \"$BRANCH_NAME\") | .ready")

echo "dbReady=$PS_BRANCH_READY" >>$GITHUB_OUTPUT
