#!/bin/sh

echo "Preparing backup..."
DATE=$(date +"%m_%d_%Y")
mkdir $DATE
echo "Backup database..."
mongodump -d firecommand_pro -o $DATE -h mongo
echo "Uploading database..."
gsutil -m cp -r $DATE gs://firecommand_db/
rm -rf $DATE
echo "done"
