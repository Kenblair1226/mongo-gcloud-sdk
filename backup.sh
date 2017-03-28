#!/bin/sh

echo "Preparing backup..." >>/var/log/cron.log 2>&1
DATE=$(date +"%m_%d_%Y")
mkdir $DATE
echo "Backup database..." >>/var/log/cron.log 2>&1
mongodump -d firecommand_pro -o $DATE -h mongo
echo "Uploading database..." >>/var/log/cron.log 2>&1
gsutil -m cp -r $DATE gs://firecommand_db/
rm -rf $DATE
echo "Done backup!" >>/var/log/cron.log 2>&1
