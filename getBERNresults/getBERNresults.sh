#!/usr/bin/env bash
# vim: set noexpandtab tabstop=2:

declare -g -A __sourced__files__
if [[ ! -v __sourced__files__[$BASH_SOURCE] || $__force__source__ ]]; then
	__sourced__files__[$BASH_SOURCE]=$(realpath "$BASH_SOURCE")
	function getBERNresults {
		declare exec_opt
		while true; do
			case $1 in
				-h|--help)
#					enable cat
					cat "${__sourced__files__[$BASH_SOURCE]%.sh}_help.txt"
					return
					;;
				--exec)
					exec_opt=exec
					shift
					;;
				--)
					shift
					break
					;;
				-*)
					echo "$FUNCNAME:ERROR:Bad option '$1'." >&2
				 	return -1
					;;
				*)
					break
					;;
			esac
		done

		declare pmid=$1
		$exec_opt wget -qO "$pmid".json https://bern.korea.ac.kr/pubmed/"$pmid"
	}

	if ! { ( return ) } 2>/dev/null; then
		set -e
		getBERNresults --exec "$@" || exit
	fi
fi

