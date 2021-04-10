#!/bin/sh
set -e

for WALLPAPER in backgrounds/*.jpg
do
    ./build/src/io.elementary.wallpapers --lint "$WALLPAPER"
done

echo "Success! Wallpapers have Artist metadata."
echo "Success! Wallpapers have valid metadata."
