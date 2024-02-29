function toptextmeme() {
        imgwidth=$(magick identify -format "%[width]" "$1[0]")
        istransparent=$(magick identify -format "%[opaque]" "$1[0]")
        fontused="Arial-Black"
        outputpath="DIRECTORYGOESHERE"
        if [ "${istransparent}" = "False" ]; then
                convert "$1" -background white -gravity north -splice 0x100 null: -size ${imgwidth}x100 -fill black -gravity North -font ${fontused}  caption:"$3" -compose Over -layers composite -layers optimize -set dispose background -coalesce "$outputpath$2"
        elif [ "${istransparent}" = "True" ]; then
                convert "$1" -background white -gravity north -splice 0x100 null: -size ${imgwidth}x100 -fill black -gravity North -font ${fontused} caption:"$3" -compose Over -layers composite -layers optimize "$outputpath$2"
        fi
}