#!/bin/bash

. ./lib/use-pscale-docker-image.sh
. ./lib/wait-for-branch-readiness.sh

. ./lib/authenticate-ps.sh

BRANCH_NAME="$1"

. ./lib/ps-create-helper-functions.sh
create-db-branch "$DB_NAME" "$BRANCH_NAME" "$ORG_NAME"

. ./lib/create-branch-connection-string.sh
create-branch-connection-string "$DB_NAME" "$BRANCH_NAME" "$ORG_NAME" "creds-${BRANCH_NAME}"

echo "DATABASE_URL=$MY_DB_URL$DB_NAME?sslaccept=strict" | base64
echo "DATABASE_URL=$MY_DB_URL$DB_NAME?sslaccept=strict" >>$GITHUB_ENV
