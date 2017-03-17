#! /bin/bash

DATE=$(date +"%m_%d_%Y")
gsutil -m cp -r gs://firecommand_db/$DATE .
mongorestore -d firecommand_pro -h 127.0.0.1 $DATE/firecommand_pro
rm -rf $DATE
