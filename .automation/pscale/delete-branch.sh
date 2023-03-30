#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

RAW_OUTPUT=$(pscale branch delete $DB_NAME $BRANCH_NAME --org $ORG_NAME --force --format json)

if [ $? -ne 0 ]; then
    echo "Error: pscale branch delete returned non-zero exit code $?: $RAW_OUTPUT"
    exit 1
fi

echo $RAW_OUTPUT
