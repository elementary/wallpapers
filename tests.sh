#!/bin/sh
set -e

# Ensure Artist metadata is not corrupt, does exist and at least 3 chars
test_artist () {
    print_error () {
        echo "Failure! $1 missing Artist metadata! See README.md."
        exit 1
    }

    ARTIST="$(exif --tag=Artist --no-fixup -m "$1")" || print_error "$1"
    if [ "$(echo "$ARTIST" | wc -m)" -lt 3 ]; then
        print_error "$1"
    fi
}

for WALLPAPER in backgrounds/*.jpg
do
    test_artist "$WALLPAPER"
done

echo "Success! Wallpapers have Artist metadata."
