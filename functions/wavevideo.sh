function wavevideo() {
        outputpath="DIRECTORYGOHERE"
        ffmpeg -y -i "$1" -threads 24 -f lavfi -i color=size=640x360:rate=25:color=black -filter_complex "[0:a]aformat=channel_layouts=mono,showwaves=size=640x360:mode=cline:rate=25:draw=full:colors=#43fa62[v];[1:v][v]overlay=format=auto:x=(W-w)/2:y=(H-h)/2,format=yuv420p[outv]" -map "[outv]" -c:a aac -map 0:a -c:v libvpx-vp9 -crf 28 -preset veryslow -b:v 0 -shortest -fflags +shortest "$outputpath$2"
}