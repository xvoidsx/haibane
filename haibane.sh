#!/usr/bin/env bash
# haibane
# # a simple SSG for xvoidsx
# > "There is no such thing as forever. Everything ends sooner or later." - Reki
set -euo pipefail
create_page () {
	local output=$1; local input=$2
	pandoc -s -o "$output" "$input" 
}
apply_theme () {
	# apply theme
	# ( the 'default' colors are from pandoc's regular theme )
	# we use `sed` to patch in our own theme
	local output=$1
	local default_bg="#fdfdfd"
	local default_fg="#1a1a1a"
	local ns_bg="#000000"
	local ns_fg="#ffffff"
	sed -i "s/$default_bg/$ns_bg/g" "$output"
	sed -i "s/$default_fg/$ns_fg/g" "$output"
}
main () {
	# quick err handling
	if [ "$#" -ne 2 ]; then
		echo "Usage: haibane [output.html] [input.md]"
		exit 1
	fi
	# - - -
	local output=$1; local input=$2
	# - - -
	echo "Generating new page..."
	create_page "$output" "$input"
	apply_theme	"$output"
	echo "Done. You can view your new page in your browser of choice."
	exit 0
}
main "$@"
# TODO adding some more things:
# 	- applying more from the nightshadeNeon theme
#   - switch up the layout a little
#   - add user-definable flags for color scheme and more (nightshadeNeon by default)
