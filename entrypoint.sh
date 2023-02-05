#!/bin/bash

SKIP_EXTRACT=0

help() {
	# print error message if set
	[[ -n "$1" ]] && log_error "$1" && echo

cat <<EOF
Help: possible arguments are:
	--skip-extract         : skip extraction step
EOF
}


parseArguments() {
	while [[ $# -gt 0 ]]
	do
		case $1 in
		--skip-extract)
			SKIP_EXTRACT=1
			;;
		--help|-h)
			help
			exit 0
			;;
		*)
			help "Unknow parameter $1"
			exit 0
			;;
		esac
		shift
	done
}

main() {
	parseArguments "$@"

	if [[ ! -d /input ]]
	then
		echo "Missing input folder"
		exit 1
	fi
	if [[ ! -d /output ]]
	then
		echo "Missing output folder"
		exit 1
	fi

	echo "Starting process"
	date
	cd /input

	if [ $SKIP_EXTRACT -eq 0 ]
	then
		echo "Starting extraction of .tar.gz files..."
		cat takeout-* | tar xzivf - 2> /input/tar_error.logs 1> /input/tar_output.logs
		echo "Extraction done"
		date
	else
		echo "Skipping extraction"
	fi

	echo "Starting gpth processing..."
	gpth-linux --no-interactive -i /input/Takeout -o /output --divide-to-dates
	echo "Processing done"

	date
}

main "$@"

exit 0
