:top
	@echo off


	:load
		cls
			set app=YTDL Utilities
			set ver=2.0.2
			set e1=ERROR 1 - INVALID NUMBER OR NOT A NUMBER
			set e2=false
			title %app% %ver%
			if exist yt-dlp.exe (if exist ffmpeg.exe (goto mainmenu) else (goto error-ffmpeg)) else (goto error-ytdlp)
		


		:mainmenu
			cls
			title %app% %ver% - Main Menu
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
				echo %app% %ver%
				echo.
				echo ---AUDIO ONLY OPTIONS---
				echo 1 - Download Single Song
				echo 2 - Download Full Playlist
				echo 3 - Download Full Channel
				echo.
				echo ---VIDEO+AUDIO OPTIONS---
				echo 4 - Download Single Video
				echo 5 - Download Full Playlist
				echo 6 - Download Full Channel
				echo.
				echo ---BATCH OPTIONS---
				echo 7 - Batch Download Songs
				echo 8 - Batch Download Song Playlists
				echo 9 - Batch Download Videos
				echo 10 - Batch Download Video Playlists
				echo 11 - Batch Download All
				echo.
				echo ---OTHER---
				echo 12 - Help
				echo 0 - Exit
				set /p m=Type number next to option, then hit enter:
					if %m%==1 goto single
					if %m%==2 goto playlist
					if %m%==3 goto channel
					if %m%==4 goto single-vid
					if %m%==5 goto playlist-vid
					if %m%==6 goto channel-vid
					if %m%==7 goto batch-audio
					if %m%==8 goto batch-audio-pl
					if %m%==9 goto batch-video
					if %m%==10 goto batch-video-pl
					if %m%==11 goto batch-all
					if %m%==12 goto help
					if %m%==0 goto exit
						echo %e1%
						pause
						goto mainmenu


			:single
				cls
				title %app% %ver% - Single Audio
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p singlelink=Paste video link (right click here), then hit enter:
					echo This should be pretty quick...
					yt-dlp --no-playlist --output "Downloaded/%%(autonumber)s-%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best "%singlelink%"
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:playlist
				cls
				title %app% %ver% - Playlist Audio
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p playlistlink=Paste playlist link (right click here), then hit enter:
					echo This can take awhile depending on size of playlist, and may even fail if the playlist is very large
					echo If it fails, you can run it again to start where it left off
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best "%playlistlink%"
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:channel
				cls
				title %app% %ver% - Channel Audio
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p channellink=Paste channel link (right click here), then hit enter:
					echo This can take a very long time depending on the channel size and you may need alot of storage
					pause
					yt-dlp --no-playlist --output "Downloaded/%%(channel)s/%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best "%channellink%"
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


      			:single-vid
				cls
				title %app% %ver% - Single
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p singlevidlink=Paste video link (right click here), then hit enter:
					echo This should be pretty quick...
					yt-dlp --no-playlist --output "Downloaded/%%(title)s.%%(ext)s" %singlevidlink%
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu

			:playlist-vid
				cls
				title %app% %ver% - Playlist
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p playlistvidlink=Paste video link (right click here), then hit enter:
					echo This can take a minute...
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" "%playlistvidlink%"
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu

			:channel-vid
				cls
				title %app% %ver% - Channel Video
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					set /p channellink=Paste channel link (right click here), then hit enter:
					echo This can take a very long time depending on the channel size and you may need alot of storage
					pause
					yt-dlp --no-playlist --output "Downloaded/%%(channel)s/%%(title)s.%%(ext)s" "%channellink%"
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:batch-audio
				cls
				title %app% %ver% - Batch Audio
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo Paste one link per line in a file called "batch-audio.txt"
					pause
					yt-dlp --no-playlist --output "Downloaded/%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best --batch-file batch-audio.txt
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:batch-audio-pl
				cls
				title %app% %ver% - Batch Audio Playlist
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo Paste one link per line in a file called "batch-audio-playlist.txt"
					pause
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best --batch-file batch-audio-playlist.txt
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:batch-video
				cls
				title %app% %ver% - Batch Video
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo Paste one link per line in a file called "batch-video.txt"
					pause
					yt-dlp --no-playlist --output "Downloaded/%%(title)s.%%(ext)s" --batch-file batch-video.txt
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:batch-video-pl
				cls
				title %app% %ver% - Batch Video Playlist
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo Paste one link per line in a file called "batch-video-playlist.txt"
					pause
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" --batch-file batch-video-playlist.txt
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:batch-all
				cls
				title %app% %ver% - Batch All
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo Paste one link per line in each respective file "batch-audio.txt", "batch-audio-playlist.txt", "batch-video.txt", and "batch-video-playlist.txt"
					pause
					yt-dlp --no-playlist --output "Downloaded/%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best --batch-file batch-audio.txt
					yt-dlp --rm-cache-dir
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" -f bestaudio[ext=m4a]/best --batch-file batch-audio-playlist.txt
					yt-dlp --rm-cache-dir
					yt-dlp --no-playlist --output "Downloaded/%%(title)s.%%(ext)s" --batch-file batch-video.txt
					yt-dlp --rm-cache-dir
					yt-dlp --yes-playlist --output "Downloaded/%%(playlist)s/%%(autonumber)s-%%(title)s.%%(ext)s" --batch-file batch-video-playlist.txt
					yt-dlp --rm-cache-dir
					echo If you see any sort of 403 error above, rerun this. If not then your good
					echo Downloaded!
						pause
						goto mainmenu


			:help
				cls
				title %app% %ver% - Help
				if %e2%==true echo ERROR: ffmpeg.exe missing, you will encounter problems with certian media players
				if %e2%==true echo.
					echo %app% help menu
					echo ----------
					echo By default, videos will download as .webm, this is due to problems with higer resolution videos. If you require .mp4 videos, you can use Handbrake.
					echo By default, videos will download at the highest availible quality. If space is a concern, use Handbrake to lower resolution or compress the video further
					echo ----------
					echo This program come with a few binaries
					echo These include; ffmpeg.exe, an av post processor used for correcting av formats and yt-dlp.exe, an binary for downloading youtube videos
					echo yt-dlp is licensed under public domain
					echo ffmpeg is licensed under the GNU Lesser General Publix License, see link for more details: https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md
					echo ----------
					echo %app% by Mia Munson
					echo Licensed under GNU GPL v3
					echo miamunson@hotmail.com
					echo ----------
					echo Version %ver%
					echo 2023-03-04
					echo ----------
					echo %app% %ver%
						pause
						goto mainmenu


			:exit
				goto :EOF

			:error-ytdlp
			echo ERROR: yt-dlp.exe not found. Make sure yt-dlp.exe is in the same directory as %app%.bat
			echo If yt-dlp.exe is missing, you can download it from https://github.com/yt-dlp/yt-dlp/releases/tag/2023.12.30
			echo As a note, %app%.bat is only tested with verion 2023.12.30 of yt-dlp. Other versions might not work as intended
			pause
			goto :EOF

			:error-ffmpeg
			echo ERROR: ffmpeg.exe not found. Make sure ffmpeg.exe is in the same directory as %app%.bat
			echo If ffmpeg.exe is missing, you can download it from https://github.com/BtbN/FFmpeg-Builds/releases
			echo Any version should work, but 2023-01-17 12:37 is the build date on the version that comes with %app%
			echo %app% will still work without ffmpeg.exe, but you will encounter problems with some media players
			set e2=true
			pause
			goto mainmenu

goto top