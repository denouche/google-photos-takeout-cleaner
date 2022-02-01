#!/bin/bash

## https://gist.github.com/TheMengzor/968e5ea87e99d9c41782
# resolve $SOURCE until the file is no longer a symlink
SOURCE="${BASH_SOURCE[0]}"
while [[ -h "${SOURCE}" ]] 
do
  DIR="$( cd -P "$( dirname "${SOURCE}" )" && pwd )"
  SOURCE="$(readlink "${SOURCE}")"
  # if $SOURCE was a relative symlink,
  # we need to resolve it relative to the path where the symlink file was located
  [[ ${SOURCE} != /* ]] && SOURCE="${DIR}/${SOURCE}"
done
BASE_PATH=$( cd -P "$( dirname "${SOURCE}" )" && pwd )


#####################################
# Program variables
#####################################

INPUT=
OUTPUT=

#####################################

help() {
    # print error message if set
    [[ -n "$1" ]] && log_error "$1" && echo

cat <<EOF
Help: possible arguments are:
  --input                       : input folder where all the takeout .tgz archives are located
  --output                      : output path after takeout processing

EOF
}

log_error() {
    echo "[ERROR] $@" 1>&2
}

parseArguments() {
    while [[ $# -gt 0 ]]
    do
        case $1 in
        --output)
			shift
            OUTPUT=$PWD/$1
            ;;
        --input)
			shift
            INPUT=$PWD/$1
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

	if [[ -z "$INPUT" ]]
	then
		help "Missing parameter: --input"
	    exit 1
	fi
	
	if [[ -z "$OUTPUT" ]]
	then
		help "Missing parameter: --output"
	    exit 1
	fi

    mkdir -p $OUTPUT

    docker build -t takeout $BASE_PATH/docker
    docker run -v $INPUT:/input -v $OUTPUT:/output --rm -it takeout
}


main "$@"

exit 0


