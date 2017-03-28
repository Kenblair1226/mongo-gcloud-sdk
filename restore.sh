#!/bin/sh

if [ -z "$1" ];
then DATE=$(date +"%m_%d_%Y")
else DATE=$1
fi
echo "Download database... $DATE" >>/var/log/cron.log 2>&1
gsutil -m cp -r gs://firecommand_db/$DATE .
rm $DATE/firecommand_pro/accesstokens.* $DATE/firecommand_pro/refreshtokens.*
echo "Restoring database..." >>/var/log/cron.log 2>&1
mongorestore --drop -d firecommand_pro -h mongo $DATE/firecommand_pro
rm -rf $DATE
echo "Done restoring!" >>/var/log/cron.log 2>&1
