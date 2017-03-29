#!/bin/sh

if [ -n "${SIDECAR_BACKUP}" ] && [ "${SIDECAR_BACKUP}" = daily ]
then crontab -u root /db_utils/backup.daily
     cron -f
elif [ -n "${SIDECAR_BACKUP}" ] && [ "${SIDECAR_BACKUP}" = weekly ]
then crontab -u root /db_utils/backup.weekly
     cron -f
fi

