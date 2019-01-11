#!/bin/bash
for dir in `/bin/cat /etc/passwd | /usr/bin/awk -F: '{ print $6 }'`; do
if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
	echo ".netrc file $dir/.netrc exists"
fi
done
