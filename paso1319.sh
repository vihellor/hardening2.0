#!/bin/bash
for dir in `/bin/cat /etc/passwd | /usr/bin/awk -F: '{ print $6 }'`; do
if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
	echo ".forward file $dir/.forward exists"
fi
done
