#! /bin/bash

if [ -z "$1" ];
then DATE=$(date +"%m_%d_%Y")
else DATE=$1
fi
gsutil -m cp -r gs://firecommand_db/$DATE .
rm $DATE/firecommand_pro/accesstokens.* $DATE/firecommand_pro/refreshtokens.*
mongorestore --drop -d firecommand_pro -h mongo $DATE/firecommand_pro
rm -rf $DATE
