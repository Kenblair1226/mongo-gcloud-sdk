# mongo-gcloud-sdk

This is a docker image based on mongo:latest with google-cloud-sdk installed. It's a utility image let you backup/restore your mongodb to/from google cloud storage.
---
To authenticate with google cloud you need to load your service account cert file and issue `gcloud auth` with file name (default is /key/gcloud-storage-key.json)
```shell
gcloud auth activate-service-account --key-file /PATH/TO/KEY_FILE
```

Then you can perform your backup/restore tasks.

The start.sh will look for environment variable SIDECAR_BACKUP to determine the backup frequency.

backup/restore script will use the following environment variables:

| Variables     | Value       |
| ------------- |-------------|
| SIDECAR_BACKUP| daily or weekly |
| DATABASE      | database name   |
| DATABASE_URL  | url to database |
| BACKUP_URL    | url to store backup files |
