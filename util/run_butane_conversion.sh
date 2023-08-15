#!/bin/sh

BUTANE_IMAGE=quay.io/coreos/butane:release

run_container() {
    podman run \
        --rm \
        --interactive \
        --volume "$PWD:/pwd" \
        --workdir /pwd \
        "$@"
}

run_container $BUTANE_IMAGE \
    --strict \
    --files-dir . \
    <butane.yaml \
    >ignition.json
