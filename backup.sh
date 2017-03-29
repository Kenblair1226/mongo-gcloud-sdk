#!/bin/sh

echo "Preparing backup..."
DATE=$(date +"%m_%d_%Y")
mkdir $DATE
echo "Backup database..."
mongodump -d $DATABASE -o $DATE -h $DATABASE_HOST
echo "Uploading database..."
/google-cloud-sdk/bin/gsutil -m cp -r $DATE $BACKUP_URL
rm -rf $DATE
echo "Done backup!"
