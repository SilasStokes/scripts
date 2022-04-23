#! /bin/bash

# Rational: KC does all of his stuff as root user and thus when he shares zips with the class they're often permission locked and/or have very s t r a n g e permissions. This should "hopefully" undo that. 

# make sure to run this script with the folder containing all the permissions you want fixed. 
sudo chown -R $(whoami):$(whoami) $1

# this is going to fix all the permissions of his .c files and directories which is
# the main problem however his shell scripts will also get normal permissions so you
# will need to manually go in and do `sudo chmod +x kc_script` to get execution back 
# to his bash scripts.
# I can't think of an easy way to differeniate his shell scripts from any other files
# since he doesn't use file extensions unless it's absolutely necessary. 
sudo find $1 -type d -exec chmod 755 {} \;
sudo find $1 -type f -exec chmod 644 {} \;
