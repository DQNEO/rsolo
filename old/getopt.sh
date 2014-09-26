#!/bin/bash
# A template of bash command which can handle subcommands
#
PROG=$(basename $0)
VERSION="0.0.1"

usage() {
    cat  <<EOF
Usage: $PROG SUBCOMMAND [OPTIONS] [ARGS]
EOF
}

usage_cmd_foo() {
    cat  <<EOF
Usage: $PROG foo [OPTIONS] [ARGS]
EOF
}

usage_cmd_bar() {
    cat  <<EOF
Usage: $PROG bar [OPTIONS] [ARGS]
EOF
}

if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
    usage
    exit 1
fi

subcmd=$1
shift

echo "subcmd = " $subcmd


for OPT in "$@"
do
    case "$OPT" in
        '-h'|'--help'|'help' )
            usage_cmd_${subcmd}
            exit 1
            ;;
        '-a'|'--long-a' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "$PROGNAME: option requires an argument -- $1" 1>&2
                exit 1
            fi
            ARG_A="$2"
            shift 2
            ;;
        '-b'|'--long-b' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                shift
            else
                shift 2
            fi
            ;;
        '-c'|'--long-c' )
            shift 1
            ;;
        '--'|'-' )
            shift 1
            param+=( "$@" )
            break
            ;;
        -*)
            echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
            exit 1
            ;;
        *)
            if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
                #param=( ${param[@]} "$1" )
                param+=( "$1" )
                shift 1
            fi
            ;;
    esac
done

if [ -z $param ]; then
    usage_cmd_${subcmd}
    exit 1
fi

echo "-a " $ARG_A
echo "arg1 = "  ${param[0]}
