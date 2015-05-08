#/bin/bash


# Little script to backup your databases
# 08.05.2015

# Define your backupfolder here:
folder=/tmp/backups/mysql

# Create folder if not there:
if [ ! -d "/tmp/backups/mysql" ]; then
	mkdir -p /tmp/backups/mysql
fi

# Deny all https requests:
touch /tmp/backups/.htaccess && echo "deny from all" >> $folder/.htaccess

# Define User:
user=

# Define your Databases here:
db1=

# db2=
# db3=

# Read the password from passwd-file:
pass=/path/to/pass/.pass

# Perform the backup
mysqldump -u$user -p`cat $pass` $db1 > "$folder"/"$db1"_$(date +"%F").dump

# next database:
# mysqldump -u$user -p`cat $pass` $db2 > "$folder"/"$db2"_$(date +"%F").dump

# Use a rotation (recommended for crontab usage):
# find $folder -ctime -7 -exec rm -rf *.dump {} \;
