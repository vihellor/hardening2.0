#!/bin/bash
cat /etc/group | /usr/bin/cut -f1 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do
	[ -z "${x}" ] && break
	set - $x
	if [ $1 -gt 1 ]; then
		gids=`/usr/bin/awk -F: '($1 == n) { print $3 }' n=$2 \
			/etc/group | xargs`
		echo "Duplicate Group Name ($2): ${gids}"
	fi
done
