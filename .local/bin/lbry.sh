# !/bin/shell

youtube-dl $(curl $1 | grep embed | sed 's/.*embed\(.*\)">.*/\1/' | cut -d '"' -f1 | awk -v prefix="https://cdn.lbryplayer.xyz/api/v2/streams/free" '{print prefix $0}')
