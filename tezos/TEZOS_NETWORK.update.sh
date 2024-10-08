#!/bin/bash

SCRIPT_FILE="TEZOS_TEZOS_NETWORK.chart.py"
CONFIG_FILE="TEZOS_TEZOS_NETWORK.conf"
HEALTH_FILE="TEZOS_TEZOS_NETWORK.health.conf"
HEALTH_ATT_FILE="TEZOS_TEZOS_NETWORK.health_attestations.conf"


if [ $# -eq 0 ]; then
	MODULES_DIR="/usr/libexec/netdata/python.d"
	ETC_DIR="/etc/netdata/python.d"
	ETC_HEALTH_DIR="/etc/netdata/health.d"
elif [ $# -eq 2 ]; then
#	MODULES_DIR=$(dirname $1)
#	ETC_DIR=$(dirname $2)
	MODULES_DIR=$1
	ETC_DIR=$2
else
	echo "In most cases you must run this script without parameters"
	echo "It will install TEZOS module to netdata daemon (or update it)"
	echo "If you have custom path to netdata lib/config directory, you must specify both in parameters:"
	echo "    Netdata python modules directory (to copy $SCRIPT_FILE)"
	echo "    Netdata python modules configuration directory (to copy $CONFIG_FILE)"
	echo "For example:"
	echo "    ./update.sh /usr/libexec/netdata/python.d /etc/netdata/python.d"
	echo "Don't forget to pull new changes from git repository of the module before run this script"
fi
if [ $# -eq 2 ] || [ $# -eq 0 ]; then
	if [ ! -d $MODULES_DIR ]; then
		echo "$MODULES_DIR is not exist!"
		echo "You can specify another modules directory, see --help"
		exit 1
	elif [ ! -d $ETC_DIR ]; then
		echo "$ETC_DIR is not exist!"
		echo "You can specify another configuration directory, see --help"
		exit 1
	else
		echo "Copying $SCRIPT_FILE to $MODULES_DIR" &&
		cp $(dirname $0)/$SCRIPT_FILE $MODULES_DIR/$SCRIPT_FILE &&
		echo "Copying $CONFIG_FILE to $ETC_DIR" &&
		cp $(dirname $0)/$CONFIG_FILE $ETC_DIR/$CONFIG_FILE &&
		echo "Copying $HEALTH_FILE to $ETC_HEALTH_DIR" &&
		cp $(dirname $0)/$HEALTH_FILE $ETC_HEALTH_DIR/$HEALTH_FILE &&
		echo "Copying $HEALTH_ATT_FILE to $ETC_HEALTH_DIR" &&
		cp $(dirname $0)/$HEALTH_ATT_FILE $ETC_HEALTH_DIR/$HEALTH_ATT_FILE &&
		chown netdata:netdata $MODULES_DIR/$SCRIPT_FILE &&
		chown netdata:netdata $ETC_DIR/$CONFIG_FILE &&
		chown netdata:netdata $ETC_HEALTH_DIR/$HEALTH_FILE &&
		chown netdata:netdata $ETC_HEALTH_DIR/$HEALTH_ATT_FILE &&
		exit 0
	fi
fi

