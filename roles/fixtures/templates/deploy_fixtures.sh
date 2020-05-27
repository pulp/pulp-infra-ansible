#!/bin/bash

set -e -u -o pipefail

STATEFILE=~/.current_fixtures
CONTAINER="{{ image }}"
[ ! -f $STATEFILE ] && touch $STATEFILE
current_deployed_version=$(cat $STATEFILE)

current_online_version=$(skopeo  inspect docker://$CONTAINER |jq .Digest)

if [ "$current_online_version" != "$current_deployed_version" ]; then
    podman pull -q $CONTAINER
    systemctl restart fixtures
    sleep 30
    podman container prune -f
fi

echo $current_online_version > $STATEFILE
