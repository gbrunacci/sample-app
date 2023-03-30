#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/authenticate-ps.sh
. ./lib/ps-create-helper-functions.sh
. ./lib/wait-for-deploy-request-merged.sh

BRANCH_NAME="$1"

create-deploy-request $DB_NAME $BRANCH_NAME $ORG_NAME
