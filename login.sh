#! /bin/bash

if [ -z "$1" ];
then gcloud auth activate-service-account --key-file /key/gcloud-storage-key.json
else gcloud auth activate-service-account --key-file $1
fi
