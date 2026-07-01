#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

DIR="$1"

for file in "$DIR"/*.{jpg,jpeg,JPG,JPEG}; do
    [ -e "$file" ] || continue

    filename=$(basename "$file")
    name="${filename%.*}"

    magick "$file" \
        -resize "3840x3840>" \
        -quality 85 \
        "$DIR/$name.webp"

    echo "Converted: $filename -> $name.webp"
done

echo "Done!"
