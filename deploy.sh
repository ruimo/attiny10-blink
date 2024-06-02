#!/bin/sh

# You don't need to deploy manually. GitHub actions will deploy pages automatically.

export U_ID=$(id -u)
export G_ID=$(id -g)
docker run -t --rm \
    --user $U_ID:$G_ID \
    --workdir="/var/home" \
    --env HOME="/var/home" \
    --volume="$PWD:/var/home" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" squidfunk/mkdocs-material gh-deploy
