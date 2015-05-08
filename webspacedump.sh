#/bin/bash


#/bin/bash


# Little script to backup your databases
# 08.05.2015

# Define your backupfolder here:
folder=/tmp/backups/webspace

# Create folder if not there:
if [ ! -d "/tmp/backups/webspace" ]; then
	mkdir -p /tmp/backups/webspace
fi

# Deny all https requests:
touch $folder/.htaccess && echo "deny from all" >> $folder/.htaccess

# Define your needed directories to be back upped:
path=/home/denis/test_dir

# Exclude folders (logs for example):
excludes="
--exclude=logs 
--exclude=
--exclude=
--exclude="

# Create the tar file:
tar -cf full_backup_$(date +"%F").tar * $path --exclude=$excludes

# Move the tar to $folder:
mv full_backup_* $folder

# Remove all backupfiles older than 7 days:
find $folder -type f -mtime +7 -exec rm -rf {} \;
