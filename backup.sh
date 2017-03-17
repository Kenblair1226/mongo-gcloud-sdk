#! /bin/bash

DATE=$(date +"%m_%d_%Y")
mkdir $DATE
mongodump -d firecommand_pro -o $DATE -h mongo
gsutil -m cp -r $DATE gs://firecommand_db/
rm -rf $DATE
