#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/wait-for-branch-readiness.sh

. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

echo "Checking if branch $BRANCH_NAME exists and is ready"

RAW_OUTPUT=$(pscale branch list "$DB_NAME" --org "$ORG_NAME" --format json)

# check return code, if not 0 then error
if [ $? -ne 0 ]; then
    echo "Error: pscale branch list returned non-zero exit code $?: $RAW_OUTPUT"
    exit 1
fi

PS_BRANCH_READY=$(echo $RAW_OUTPUT | jq ".[] | select(.name == \"$BRANCH_NAME\") | .ready")

echo "dbReady=$PS_BRANCH_READY" >>$GITHUB_OUTPUT
