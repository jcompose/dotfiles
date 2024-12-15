#!/usr/bin/env sh

# Download the last 2 weeks of videos
yt-dlp \
  --no-config \
  --format "bestvideo[height<=1080][ext=mp4]+bestaudio/best[height<=1080][ext=mp4]" \
  --download-archive /root/archive.txt \
  --embed-metadata \
  --embed-thumbnail \
  --embed-subs \
  --sponsorblock-mark all \
  --dateafter today-2weeks \
  --break-on-reject \
  --break-on-existing \
  --break-per-input \
  --cookies /root/cookies.txt \
  --batch-file /root/youtube.txt \
  -o "/Library/%(channel)S/%(title)S.%(ext)s"

# Delete videos older than 2 weeks
find /Library -type f -mtime +14 -exec rm -f {} \;
