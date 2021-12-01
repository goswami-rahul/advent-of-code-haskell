#!/usr/bin/zsh

YEAR="2021"
COOKIE=$(<./.cookie)
HS_TMPL="tmpl.hs"

day=${1:?Need day number}

printf -v srcfile "day%02d.hs" $day
printf -v infile "inputs/day%02da.txt" $day
printf -v outfile "outputs/day%02da.txt" $day
printf -v url "https://adventofcode.com/$YEAR/day/%01d/input" $day

mkdir -p inputs
mkdir -p outputs
mkdir -p .backup

curl -o $infile $url -sSH "cookie: ${COOKIE}"

[ -s $srcfile ] && mv $srcfile "./.backup/${srcfile}.bak.hs"

sed -e "s|INPUT_FILE_NAME|${infile}|g; s|OUTPUT_FILE_NAME|${outfile}|g" "$HS_TMPL" > "$srcfile"