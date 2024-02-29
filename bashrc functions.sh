# More complex YT-DLP downloader than the alias version. This version supports removing elements of the title.
function ytdlp-dir-music() {
        read -p "Input Media to download: " -r InputMedia
        read -p "Remove String in Title: " -r TitleString
        yt-dlp ${InputMedia} -x --ignore-errors --add-metadata --parse-metadata 'playlist_index:%(track_number)s' --add-metadata --replace-in-metadata title "${TitleString}" "" --embed-thumbnail --audio-format mp3 -o '/%(playlist_index)s.%(title)s.%(ext)s'
}