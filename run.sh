#!/bin/sh
export U_ID=$(id -u)
export G_ID=$(id -g)
docker run -it --rm \
    -p 8040:8040 \
    --user $U_ID:$G_ID \
    --workdir="/var/home" \
    --env HOME="/var/home" \
    --volume="$PWD:/var/home" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" squidfunk/mkdocs-material serve -a 0.0.0.0:8040

