#!/usr/bin/env bash
if [[ "${channel}" == "rc" ]]; then
    version=$(curl -sX GET https://api.github.com/repos/debridmediamanager/zurg/releases/latest --header "Authorization: Bearer ${TOKEN}" | jq --raw-output '. | .tag_name')
else
    version=$(curl -sX GET https://api.github.com/repos/debridmediamanager/zurg-testing/releases/latest --header "Authorization: Bearer ${TOKEN}" | jq --raw-output '. | .tag_name')
fi
version="${version#*release-}"
printf "%s" "${version}"