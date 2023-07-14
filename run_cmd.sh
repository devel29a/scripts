#!/bin/bash

# Usage example:
# run_cmd "/usr/bin/app arg1 arg2" "TAG" "/path/to/dir" "ref_duration"
# Output example:
# [TAG][158M]	00m25s(25s)	x25.00	/usr/bin/app arg1 arg2

run_cmd() {
    local t1=`date +%s`
    ${1}
    local t2=`date +%s`
    d=$((t2-t1))
    printf "[$2][%s]\t%s(%ss)\tx%s\t$1\n" `du -hs ${3} | awk '{print $1}'`  `date -d@${d} -u +%Mm%Ss` ${d} `awk "BEGIN {printf(\"%.2f\"), $d/$4}"`
}
