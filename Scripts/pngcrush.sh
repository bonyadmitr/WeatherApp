#!/bin/sh

if which pngcrush >/dev/null; then

	all_pngs=$(find ./WeatherApp -type f -name "*.png")

	for png in $all_pngs; do
	    echo "pngcrush $png ..."
	    res=$(pngcrush -brute -reduce "$png" temp.png > /dev/null 2>&1)

	    # preserve original on error
	    if $res; then
	        mv -f temp.png "$png"
	    else
	    	echo "Error with: $png"
	        rm temp.png
	    fi
	done
else
  	echo "Hmm, you're missing PNGCRUSH. Install it for best result"
fi

## other scripts for image optimizations
# https://gist.github.com/ryansully/1720244
# https://gist.github.com/sergeylukin/6510605

## jpegtran
# all_jpgs=$(find ./WeatherApp -type f -name "*.jpg")

# for jpg in $all_jpgs; do
#     echo "jpegtran $jpg ..."
#     jpegtran -copy none -optimize -perfect "$jpg" > temp.jpg

#     # preserve original on error
#     if [ $? = 0 ]; then
#         mv -f temp.jpg $jpg
#     else
#         rm temp.jpg
#     fi
# done