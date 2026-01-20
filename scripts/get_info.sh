#!/bin/bash

package_name=$1
override_version=$2
apk_url=$3

if [[ -n "$override_version" && -n "$apk_url" ]]; then
    echo "Using override version: $override_version"
    echo "Using APK URL: $apk_url"
    echo "[{\"version\": \"$override_version\", \"url\": \"$apk_url\"}]" > output.json
    exit 0
fi

go run github.com/pokeguys/apk-crawler/cmd/crawler@v1.1.2 apkpure \
    -p $package_name --json > output.json
