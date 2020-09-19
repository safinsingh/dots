#!/usr/bin/env bash
set -e

token="GUcMwIM9R7r9vSdk31NpAyQ5hdaWE0A6QkXKZUkD7w6dte6oFIfDL2NbLQgWUbkJZSOwAzPsN1vv26FCccllNhcy1L2RBHWthB129dGGbpWrqWgZXstJqWypa4ST5ub2"
woof_home="$HOME/.woof"

if ! command -v curl &> /dev/null
then
  echo "Curl is not installed!"
  exit 1
fi

usage() {
  echo "Usage: $0 [-h] [-c] [-n] [-f <file>]"
  echo "             -h Help"
  echo "             -c Upload png from clipboard"
  echo "             -f Upload file from computer"
  echo "             -n Show a notification after upload"
  exit
}

mkdir -p "$woof_home/uploads/"
if [ -z "$token" ]; then
  echo "No Token, edit this script and add it"
  exit
fi

file_name="$(hexdump -n 4 -e '4/4 "%00X"' /dev/random | awk '{print tolower($0)}').png"
upload_path="$woof_home/uploads/$file_name"
show_notification=false

while getopts ":cnhf:" opt; do
  case $opt in
    f)
      if [ ! -f "$upload_path" ]; then
        inf=$OPTARG
        if [ ! -f "$inf" ]; then
          echo "No such file $inf"
          exit 1
        fi
        upload_path="$inf"
      fi
      ;;
    c)
      if [ ! -f "$upload_path" ]; then
        if command -v xclip &> /dev/null
        then
          xclip -selection clipboard -target image/png -o > "$upload_path" 
        else
          echo "No clipboard tool found! Please install xclip"
          exit 1
        fi 
      fi
      ;;
    n)
      show_notification=true
      ;;
    h) usage ;;
    *) usage ;;
  esac
done

if [ ! -f "$upload_path" ]; then
  if command -v gnome-screenshot &> /dev/null
  then
    gnome-screenshot -a -f "$upload_path"
  elif command -v maim &> /dev/null
  then
    maim -s -l -c 1,1,1,0.2 "$upload_path"
  else
    echo "No screenshot tool found! Please install gnome-screenshot or maim"
    exit 1
  fi
  if [ ! -f "$upload_path" ]; then
        echo "You didn't take a screenshot!"
        exit 1
  fi
fi

basename=${upload_path##*/}
mime_type=$(file -b --mime-type $upload_path)
json_out=$(curl -# -i -X POST -H "Content-Type: application/octet-stream" -H "Authorization: Bearer $token" --data-binary "@$upload_path" "https://pat.doggo.ninja/v1/upload?originalName=$basename&mimeType=$mime_type" | tail -n 1)

url=$(echo $json_out| jq -r '.url')
echo
echo "URL: $url"

if command -v pbcopy &> /dev/null
then
  echo -n $url | pbcopy
elif command -v xclip &> /dev/null
then
  echo -n $url | xclip -selection clipboard -i
else
  echo "No clipboard tool found! Please install xclip or pbcopy"
  exit
fi

echo "Also copied to your clipboard"

if $show_notification
then
  if command -v notify-send &> /dev/null
  then
    notify-send "Uploaded $basename" "The url has been copied to your clipboard"
  else
    echo "No notification tool found! Please install notify-send (libnotify)"
    exit 1
  fi
fi

exit