#!/bin/bash
dir=$1

if [ -z "$dir" ]
then
    echo "Error: please specify a directory"
    exit 1
fi

# Archive all files in directory
tar -czvf archive_all.tar.gz "$dir"
echo "All files archived to archive_all.tar.gz"

# Archive only files modified less than a week ago
find "$dir" -mtime -7 -type f | tar -czvf archive_week.tar.gz -T -
echo "Files modified in last 7 days archived to archive_week.tar.gz"
