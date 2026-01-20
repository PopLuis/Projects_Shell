#!/bin/bash

TARGET_DIR="/home/$USER/backups"
SOURCE_DIR="/var/log"
TIME_STAMP=$(date +%Y-%m-%d)
FILE_NAME="logs_$TIME_STAMP.tar.gz"

mkdir -p "$TARGET_DIR"

sudo tar -czf "$TARGET_DIR/$FILE_NAME" "$SOURCE_DIR" 2>/dev/null

echo "Backup-ul a fost creat cu succes în: $TARGET_DIR/$FILE_NAME"
