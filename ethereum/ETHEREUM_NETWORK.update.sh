#!/bin/bash

SCRIPT_FILE="ETHEREUM_ETHEREUM_NETWORK.chart.py"
CONFIG_FILE="ETHEREUM_ETHEREUM_NETWORK.conf"
HEALTH_EXE_FILE="ETHEREUM_ETHEREUM_NETWORK.health_execution.conf"
HEALTH_CON_FILE="ETHEREUM_ETHEREUM_NETWORK.health_consensus.conf"


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
	echo "It will install ETHEREUM module to netdata daemon (or update it)"
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
		echo "Copying $HEALTH_EXE_FILE to $ETC_HEALTH_DIR" &&
		cp $(dirname $0)/$HEALTH_EXE_FILE $ETC_HEALTH_DIR/$HEALTH_EXE_FILE &&
		echo "Copying $HEALTH_CON_FILE to $ETC_HEALTH_DIR" &&
		cp $(dirname $0)/$HEALTH_CON_FILE $ETC_HEALTH_DIR/$HEALTH_CON_FILE &&
		chown netdata:netdata $MODULES_DIR/$SCRIPT_FILE &&
		chown netdata:netdata $ETC_DIR/$CONFIG_FILE &&
		chown netdata:netdata $ETC_HEALTH_DIR/$HEALTH_EXE_FILE &&
		chown netdata:netdata $ETC_HEALTH_DIR/$HEALTH_CON_FILE &&
		exit 0
	fi
fi

