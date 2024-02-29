# More complex YT-DLP downloader than the alias version. This version supports removing elements of the title.
function ytdlp-dir-music() {
        read -p "Input Media to download: " -r InputMedia
        read -p "Remove String in Title: " -r TitleString
        yt-dlp ${InputMedia} -x --ignore-errors --add-metadata --parse-metadata 'playlist_index:%(track_number)s' --add-metadata --replace-in-metadata title "${TitleString}" "" --embed-thumbnail --audio-format mp3 -o '/%(playlist_index)s.%(title)s.%(ext)s'
}

# Make Green wave video with a simple 2 options, be sure to set the output directory with the outputpath variable before using!

function wavevideo() {
        outputpath="DIRECTORYGOHERE"
        ffmpeg -y -i "$1" -threads 24 -f lavfi -i color=size=640x360:rate=25:color=black -filter_complex "[0:a]aformat=channel_layouts=mono,showwaves=size=640x360:mode=cline:rate=25:draw=full:colors=#43fa62[v];[1:v][v]overlay=format=auto:x=(W-w)/2:y=(H-h)/2,format=yuv420p[outv]" -map "[outv]" -c:a aac -map 0:a -c:v libvpx-vp9 -crf 28 -preset veryslow -b:v 0 -shortest -fflags +shortest "$outputpath$2"
}

# simple function to convert video's to gif's

function videotogif() {
        ffmpeg -i "$1" -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "$2"
}

# Slightly complex function to create top text memes with image magick, supports transparent gif's and images as well as custom fonts and output paths.

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