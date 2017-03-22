#! /bin/bash

if [ -z "$1" ];
then DATE=$1
else DATE=$(date +"%m_%d_%Y")
fi
gsutil -m cp -r gs://firecommand_db/$DATE .
rm $DATE/firecommand_pro/accesstokens.* $DATE/firecommand_pro/refreshtokens.*
mongorestore --drop -d firecommand_pro -h 127.0.0.1 $DATE/firecommand_pro
rm -rf $DATE
