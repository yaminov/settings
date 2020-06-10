#!/bin/bash

#create local backup tarball
tar --exclude=build --exclude=bin --exclude='*.raw' -zcvf /opt/backup/pro/pro.tar.gz /mnt/nvme/pro/

#sync with remote backup server
rsync -avzh --delete /opt/backup/pro /mnt/esafeline/backup

#sync with cloud
rclone sync /opt/backup/pro gdrive:backup

