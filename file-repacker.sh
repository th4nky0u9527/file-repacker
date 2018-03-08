#!/bin/bash
# Example:
#   ./regroup.sh [dir] [files per group]
#
# arg1 is the directory of files to be grouped
# arg2 is the quantities of files per group

files=$(ls ${1})
cnt=$((0))
padding=$(echo $(($(echo $files | wc -w)/${2}-1)) | wc -m)

for f in $files
do
    id=$(printf "%0${padding}d" $((${cnt}/${2})))
    grp="group_$id"
    [ -d ${grp} ] || mkdir ${grp}
    cp ${1}/${f} ${grp}/

    cnt=$(($cnt+1))
done
