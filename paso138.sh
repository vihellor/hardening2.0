#!/bin/bash
for dir in `/bin/cat /etc/passwd | /bin/egrep -v '(root|sync|halt|shutdown)' | /usr/bin/awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
	for file in $dir/.[A-Za-z0-9]*; do
		if [ ! -h "$file" -a -f "$file" ]; then
			fileperm=`/bin/ls -ld $file | /usr/bin/cut -f1 -d" "`
			if [ `echo $fileperm | /usr/bin/cut -c6 ` != "-" ]; then
				echo "Group Write permission set on file $file"
			fi
			if [ `echo $fileperm | /usr/bin/cut -c9 ` != "-" ]; then
				echo "Other Write permission set on file $file"
			fi
		fi
	done
done
