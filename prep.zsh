#!/usr/bin/zsh

YEAR="2021"
COOKIE=$(<./.cookie)
HS_TMPL="tmpl.hs"

day=${1:?Need day number}
level="${2:?Need level [1|2]}"

printf -v srcfile "day%02d.hs" $day
printf -v infile "inputs/day%02d_%d.txt" $day $level
printf -v outfile "outputs/day%02d_%d.txt" $day $level
printf -v url "https://adventofcode.com/$YEAR/day/%01d/input" $day

mkdir -p inputs
mkdir -p outputs
mkdir -p .backup

curl -o $infile $url -sSH "cookie: ${COOKIE}"

if [[ -s $srcfile ]]; then 
  cp $srcfile "./.backup/${srcfile}.bak.hs"
  # in place update filenames
  sed -e "\|^inFile =|c inFile = \"${infile}\"" -e "\|^outFile =|c outFile = \"${outfile}\"" -i "$srcfile"
else
  # copy from template
  sed -e "\|^inFile =|c inFile = \"${infile}\"" -e "\|^outFile =|c outFile = \"${outfile}\"" "$HS_TMPL" > "$srcfile"
fi