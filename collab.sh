

usermod -a -G <group_name> <user>

# Set group and permissions 

chgrp -R <group_name> <folder>
chmod -R g+w <group_name>


# Set all folders as read-write for the owner, even new ones

find <folder> -type d -exec chmod 2775 {} \;

find <folder> -type f -exec chmod ug+rw {} \; 

# From: https://superuser.com/questions/19318/how-can-i-give-write-access-of-a-folder-to-all-users-in-linux/19333#19333 and https://superuser.com/questions/280994/give-write-permissions-to-multiple-users-on-a-folder-in-ubuntu
