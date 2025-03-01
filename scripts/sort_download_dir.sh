#!/bin/sh
# moves file from downloadDir to there folders

# all the directories and mkdir them if not exists
downloadDir=$(xdg-user-dir DOWNLOAD) ;  [ -d $downloadDir ] || mkdir $downloadDir

archiveDir="$downloadDir/archive" ;     [ -d $archiveDir  ] || mkdir $archiveDir
audioDir="$downloadDir/audio" ;         [ -d $audioDir    ] || mkdir $audioDir
documentDir="$downloadDir/document";    [ -d $documentDir ] || mkdir $documentDir
imageDir="$downloadDir/image";          [ -d $imageDir    ] || mkdir $imageDir
isoDir="$downloadDir/iso";				[ -d $isoDir	  ] || mkdir $isoDir
programDir="$downloadDir/program";		[ -d $programDir  ] || mkdir $programDir
textDir="$downloadDir/text";            [ -d $textDir     ] || mkdir $textDir
torrentDir="$downloadDir/torrent";      [ -d $torrentDir  ] || mkdir $torrentDir
videoDir="$downloadDir/video";          [ -d $videoDir    ] || mkdir $videoDir
scriptDir="$downloadDir/script";        [ -d $scriptDir   ] || mkdir $scriptDir

inotifywait -m $downloadDir -e create -e moved_to | 
	while read filepath action file_name; do
		case ${file_name##*.} in
			# archive
			7z|gz|rar|tar|tgz|Z|zip)
				move_to_dir=$archiveDir ;;
			# audio
			flac|mp3|wav)
				move_to_dir=$audioDir ;;
			# document
			docx|pptx)
				move_to_dir=$documentDir ;;
			# image
			gif|jpeg|jpg|png)
				move_to_dir=$imageDir ;;
			# iso
			iso)
				move_to_dir=$isoDir ;;
			# program
			apk|AppImage|deb)
				move_to_dir=$programDir ;;
			# text
			md|pdf|tex|txt)
				move_to_dir=$textDir ;;
			# torrent
			torrent)
				move_to_dir=$torrentDir ;;
			# video
			gifv|mkv|mp4)
				move_to_dir=$videoDir ;;
			# script
			bash|exe|py|sh)
				move_to_dir=$scriptDir ;;
			# default
			*)
				continue ;;
		esac

		mv "$downloadDir/$file_name" "$move_to_dir"
		notify-send -a "DOWNLOAD SORTING" -u low "${move_to_dir##*/}" "$file_name downloaded"

	done
