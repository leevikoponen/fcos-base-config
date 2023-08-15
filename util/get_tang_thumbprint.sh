#!/bin/sh

TANG_URL=http://home.hosts.leevikoponen.fi:1337

fetch_public_keys() {
    curl --silent --show-error --fail-early $TANG_URL/adv
}

take_first_line() {
    head --lines 1
}

decode_payload() {
    jose fmt --json - --get payload --b64load --output -
}

validate_key() {
    jose jwk use --input - --required --use verify --output -
}

print_thumbprint() {
    jose jwk thp --input - --algorithm S256
}

fetch_public_keys |
    take_first_line |
    decode_payload |
    validate_key |
    print_thumbprint
