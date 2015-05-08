# Two script for a little easy backup

1. Clone or copy the script:
    git clone 

2. Give the executive permissions:
    chmod +x webspacedump.sh mysqldump.sh

3. Fill in your password into .pass
    echo "YourPassword" >> .pass

3. Setup a cronjob:
    00 00 * * * /path/to/webspacedump.sh
    00 00 * * * /path/to/mysqldump.sh

4. Enjoy
