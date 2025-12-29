#!/usr/bin/env sh

show_thumbnails=1
load_thumbnail_viewer kitty
async_thumbnails=1
preview_window_width=25%
YTFZF_PREF="bestvideo[vcodec^=avc1][height<=?720][fps<=?30]+bestaudio/best"
# invidious_instance="https://vid.puffyan.us"

# Use direct YouTube scraping as Invidious instances are failing
scrape="yt"

# FORCE FORMAT (THIS IS THE KEY)
# YTFZF_PLAYER="mpv"
# YTFZF_PLAYER_OPTS="--ytdl-format=best[height<=360]/bestvideo+bestaudio"
