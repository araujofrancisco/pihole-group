# pihole-group
<h3>Description</h3>
This script is mean to update pihole group to enable/disable when running on a docker container, the change is achived updating the gravity database directly using docker exec command. Intended to allow using cron to schedule job and enable/disable rules automatically.
</br>
Update the database only if current value is different from the parameter, this allow the script to return the affected rows that could be used for expanded automation.

<h3>Setting it up</h3>
Set the script to executable: chmod +x pihole-group.sh

<h3>Usage</h3>
<code>pihole-group.sh < enable | disable > < group-name1,group-name2,group-name3 ></code>
</br>Multiple groups can be updated at once passing as second parameter comma separated list.
</br>You might require root permissions to execute docker commands.

<h3>Notes</h3>
Depending on docker container setup you might require to change the pihole and database variables to point the right place.
