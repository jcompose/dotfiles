#!/usr/bin/env sh

yt-dlp \
  --audio-format mp3 \
  --audio-quality 0 \
  --batch-file /root/music.txt \
  --break-on-existing \
  --break-per-input \
  --cookies /root/cookies.txt \
  --dateafter now-3years \
  --download-archive /root/archive.txt \
  --embed-metadata \
  --embed-thumbnail \
  --extract-audio \
  --fragment-retries 10 \
  --limit-rate 5M \
  --match-filter "categories *= 'Music' & title !~= '(?i)vlog|tutorial|remix|behind the scenes|trailer|visualizer'" \
  --max-sleep-interval 30 \
  --no-config \
  --retries 10 \
  --skip-playlist-after-errors 10 \
  --sleep-interval 10 \
  --socket-timeout 30 \
  --windows-filenames \
  -o "/Library/%(artists.0,channel)s/%(album,playlist_title)s/%(playlist_index|)s%(playlist_index& - )s%(track,title)s.%(ext)s"
