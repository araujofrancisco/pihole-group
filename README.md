# pihole-group
Script to all enable/disable docker pihole group.

This is mean to update pihole group to enable/disable when running on a docker container, the change is achived updating the gravity database directly using docker exec command. Intended to allow using cron to schedule job and enable/disable rules automatically.

The script only updates database if current value is different from the parameter, this allow the script to return the affected rows that could be used for expanded automation.

Set the script to executable: <code>chmod +x pihole-group.sh</code>

Usage: pihole-group.sh <enable|disable> <groupname>

Depending on docker container setup you might require to change the pihole and database variables to point the right place.
