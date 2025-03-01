#!/bin/bash

# consts
diawi_url='https://upload.diawi.com'
help_msg="
Usage: diawi_uploader.sh [OPTION...]

Upload IPA file to Diawi using Diawi's Upload APIs.

Options
  -t          Diawi token.
  -f          File path to IPA file.
  -F          Flutter project, ipa|apk|app
  -h          Print this help message.
  -e          Email id to receive the upload notification.

Note:
  - Token (-t <token>) and File (-f <file> or -F) are required
  - Flutter option defaults to 'build/ios/ipa/<app>.ipa' file
  - Diawi token can be generated from 'https://dashboard.diawi.com/profile/api'
  - Read more about Diawi API Docs from 'https://dashboard.diawi.com/docs/apis/upload'

Example:
  diawi_uploader -t <token> -F <file_type>
  diawi_uploader -t <token> -F <file_type> -e <email_id>
  diawi_uploader -t <token> -f <file_path> -e <email_id>
"

# handle options
#   : -> for options with value
#   ? -> for options without value
while getopts ":t:f:e?F?h" flag; do
	case "$flag" in
	h)
		# echo -e $help_msg
		echo "$help_msg"
		exit
		;;
	t)
		# Get Diawi token
		token=$OPTARG
		;;
	F)
		# Get path to IPA file inside flutter project
		# TODO: use flutter type to upload all IPA|APK|APP
		file="$(ls build/ios/ipa/*.ipa)"
		;;
	f)
		# Get file path to IPA file
		file=$OPTARG
		;;
	e)
		# Get email ID to receive upload notification
		email=$OPTARG
		;;
	*)
		echo "Invalid argument provided"
		echo "$help_msg"
		exit 1
		;;
	esac
done

# Checks if token is provider
[ -z $token ] && echo "Pass token with -t option. Get more info with --help" && exit 1
# Checks if file path is provided or Flutter option is used
[ -z $file ] &&
	echo "Pass file path with -f option or pass -F option for flutter project" &&
	exit 1
# Checks if file exists
[ ! -f "./$file" ] && echo "'$file' does not exists" && exit 1

printf "\n=> File found at '$file'\n"

# set upload command
cmd_upload="curl --http1.1 $diawi_url -F token='$token' -F file=@'$file'"
[ ! -z $email ] && cmd_upload="$cmd_upload -F callback_emails='$email'"

printf "\n=> Uploading IPA file\n"
# Upload IPA file to Diawi
res_upload=$(eval "$cmd_upload")

# Extract the job ID from the upload response
job=$(echo "$res_upload" | jq -r '.job')

# set status command
cmd_status="curl -s '$diawi_url/status?token=$token&job=$job'"

printf "\n=> Getting Diawi Link\n"
# Wait for 2 seconds before checking upload status
sleep 3s
# Get the upload status from Diawi
res_status=$(eval "$cmd_status")

# Extract the Diawi link from the status response
link=$(echo "$res_status" | jq -r '.link')
if [ -z $link ]; then
	echo "Something went wrong :("
	exit 1
else
	printf "\n==> Diawi Link:\n\t$link\n"
fi
