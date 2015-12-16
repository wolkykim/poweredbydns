#!/bin/sh

TARGET="../html"
for file in `ls ${TARGET}/*.html`; do
	echo "Converting $file"
	sed -e 's% </td>%</td>%' ${file} > ${file}.tmp
	mv ${file}.tmp ${file}
done
