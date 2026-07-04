#!/usr/bin/env bash
# haibane
# a simple SSG for xvoidsx
set -euo pipefail
create_page () {
	local output=$1
	local input=$2
	pandoc -s -o "$output" "$input" 
}
main () {
	# quick err handling
	if [ "$#" -ne 2 ]; then
		echo "Usage: haibane [output.html] [input.md]"
		exit 1
	fi
	# - - -
	echo "Generating new page..."
	create_page $1 $2		# pass args to func
	echo "Done. You can view your new page in your browser of choice."
	exit
}
main "$@"
