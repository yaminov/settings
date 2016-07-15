#!/bin/bash

rsync -avzh --delete --progress /home/kamil/pro/ /mnt/arc-backup/pro/
date > /mnt/arc-backup/pro/last-backup
