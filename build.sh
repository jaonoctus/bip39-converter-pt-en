#!/bin/bash

main() {
    npm run build
    local version=$(jq -r '.version' package.json)
    (
        cd dist
        local output_file="bip39-converter-pt-en-standalone-v${version}.html"
        cp "index.html" "${output_file}"
        sha256sum "${output_file}" > "SHA256SUM"
        gpg --detach-sign --armor "SHA256SUM"
    )
}

main