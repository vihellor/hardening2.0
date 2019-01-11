#!/bin/bash
/bin/cat /etc/group | /usr/bin/cut -f3 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do
	[ -z "${x}" ] && break
	set - $x
	if [ $1 -gt 1 ]; then
		grps=`/usr/bin/awk -F: '($3 == n) { print $1 }' n=$2 \
			/etc/group | xargs`
		echo "Duplicate GID ($2): ${grps}"
	fi
done
