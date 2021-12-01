#!/usr/bin/zsh

YEAR="2021"
COOKIE=$(<./.cookie)

day="${1:?Need day number}"
level="${2:?Need level [1|2]}"

printf -v outfile "outputs/day%02d_%d.txt" $day $level
printf -v url "https://adventofcode.com/$YEAR/day/%01d/answer" $day

[ -f $outfile ] || { echo "$outfile is empty" && exit 1 }

payload="level=${level}&answer=$(<${outfile})"

curl -X POST $url -d $payload -sSH "cookie: ${COOKIE}" | awk "/<article>/,/<\/article>/"