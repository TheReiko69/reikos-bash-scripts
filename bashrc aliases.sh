# a Simple YT-DLP alias for downloading music from platforms YT-DLP supports with a bit of automatic metadata embedding. Must be in specific folder before using.
alias ytdlp-dir-music="yt-dlp -x --ignore-errors --add-metadata --parse-metadata 'playlist_index:%(track_number)s' --add-metadata --embed-thumbnail --audio-format mp3 -o '/%(playlist_index)s.%(title)s.%(ext)s'"

# YT-DLP alias for downloading meme videos to a specific directory
alias ytdlp-meme="yt-dlp -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' -o 'DIRECTORYGOHERE/%(playlist_index)s.%(title)s.%(ext)s' -S res,ext:mp4 --recode mp4"

