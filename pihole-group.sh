#!/usr/bin/env bash

readonly pihole="pihole_pihole.*"
readonly database="/etc/pihole/gravity.db"

print_usage() {
	echo "Usage: pihole-group <enable|disable> <groupname1,groupname2,groupname3,...>"
	exit 0
}

if [ $# -ne 2 ]
then
	print_usage
fi

groups="('"$(sed "s/,/','/g"<<<$2)"')"
#echo $groups

case "${1}" in
	"enable")  action=1;;
	"disable") action=0;;
	*) print_usage;;
esac

# build up the command to update the enabled setting for the group only if value differs
# so this way we can return the number of rows affected
cmd="update 'group' set enabled = $action where name in $groups and enabled <> $action;select changes();"
#echo $cmd

# does execute the command on pihole container, container name might differ depending on setup
# the location for the database might be difference as well
docker exec $(docker ps | grep -o "$pihole") sqlite3 "$database" "$cmd"

