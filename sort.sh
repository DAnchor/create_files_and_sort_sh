#!/bin/bash
dir="media"
if [ -d "media" ]
then
    printf "directory %s exists $dir"
else
    mkdir $dir
    printf "created %s $dir"
fi

touch media/{{a..f}{1..15},{f..k}{16..31},{k..z}{32..46}}
files=$(ls *)
declare -a lst=($files)
IFS=$'\n' s=($(sort -r <<< "${lst[*]}"))
export xs=$(printf "[%s]," "${s[@]}")
cat << EOF > srt.lst 2>&1
$xs
EOF
