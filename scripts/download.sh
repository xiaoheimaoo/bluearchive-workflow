#!/bin/bash

package_name=$1
apk_url=$2

if [ -n "$apk_url" ]; then
    echo "Using APK URL: $apk_url"
    echo "[{\"url\": \"$apk_url\"}]" > output.json
fi

cat output.json | jq -r '.[0].url' | \
    go run github.com/melbahja/got/cmd/got@latest -o output.xapk

if [ $? -ne 0 ]; then
    echo "Failed to download APK"
    exit 1
fi

echo "APK downloaded successfully"
