#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

echo "Checking if branch $BRANCH_NAME has differences with main branch."

DIFF_CMD="pscale branch diff $DB_NAME $BRANCH_NAME --org $ORG_NAME --format json"
DIFF_CMD_OUTPUT=$($DIFF_CMD)

# check return code, if not 0 then error
if [ $? -ne 0 ]; then
    echo "Error: $DIFF_CMD returned non-zero exit code $?. See output below."
    echo $DIFF_CMD_OUTPUT
    exit 1
fi

echo $DIFF_CMD_OUTPUT | jq .

BRANCH_DIFF_COUNT=$($DIFF_CMD --format json | jq length)

echo "branchDiffCount=$PS_BRANCH_DIFF_COUNT" >>$GITHUB_OUTPUT
