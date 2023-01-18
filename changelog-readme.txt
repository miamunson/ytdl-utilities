Major changes: 
- Version bumped to 2.0
- Switched backend to yt-dlp, significantly more efficient than youtube-dl
- YTDL Music & YTDL Video merged into YTDL Utilities
- Windows 7 and 8.1 support dropped, not guaranteed to work properly, but might still. Windows 7 and 8.1 bugs will not be fixed, only Windows 10 and 11 are supported

Minor:
- Added option to download video playlists
- Added option to download full channels as either audio only or as full videos
- Added multiple options for batch downloads, making it easy to download a massive amount of songs and videos without user interation beyon a few button presses
- Download speed massively increased, in some cases speed is still slow. This cannot be fixed at the moment
- Downloads will download to "Downloaded" folder
- Videos now download as .webm instead of .MP4 due to issues with some videos, use VLC for playback if your media player does not support .webm
- Fixed an issue where low quality audio wouldn't download
- Fixed an issue where "single song" option would download a full playlist instead of the current song
- Fixed an issue where 403 errors were common (during debugging, I only got one and it automaticly rettied the video without starting over)
- Fixed an issue where videos over 1080p would not download in the highest quality
- Now licensed under GNU GPL v3
- Various grammer changes and corrections
- YTDL Utilities now checks for yt-dlp.exe and ffmpeg.exe
- Error 2 added, shows message at top of window when ffmpeg.exe is not present

Notes:
- If files are too large, resolution unnecessarily high, or "webm" not a suitable format then use Handbrake to compress or change format (or modify YTDL to download MP4 instead of webm, but you will have issues on some videos so this is not recommended)
- Bugs can be reported to miamunson@hotmail.com or to Meeps#8885 on Discord. Include as much detail as possible, including OS and the full output of the window for YTDL Utilities
- Currently, using Batch Playlist mode will result in the numbering continuing into the next playlist. ex; playlist 1 has 30 songs, numbered 1-30, playlist 2 has 5 songs, numbered 31-35. No fix currently known, use batch renaming software or do each playlist individualy if that is a problem for you