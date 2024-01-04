#!/bin/zsh

read -p 'Link for the video: ' ytlink

cd ~;
cd Downloads;
mkdir ytdlphandbrake;
cd ytdlphandbrake;
output_file=$(yt-dlp --get-filename -o "%(title)s.%(ext)s" "$ytlink")
yt-dlp -o "$output_file" "$ytlink";
handbrakeCLI -Z "H.265 Apple VideoToolbox 1080p" -i "$output_file" -o "${output_file%.*}.mp4";
mv "${output_file%.*}.mp4" ~/Downloads;
cd ..;
rm -r ytdlphandbrake;
