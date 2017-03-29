#!/bin/sh

if [ -z "$1" ];
then DATE=$(date +"%m_%d_%Y")
else DATE=$1
fi
echo "Download database... $DATE"
/google-cloud-sdk/gsutil -m cp -r $DATABASE_URL$DATE .
rm $DATE/$DATABASE/accesstokens.* $DATE/$DATABASE/refreshtokens.*
echo "Restoring database..."
mongorestore --drop -d $DATABASE -h $DATABASE_HOST $DATE/$DATABASE
rm -rf $DATE
echo "Done restoring!"
