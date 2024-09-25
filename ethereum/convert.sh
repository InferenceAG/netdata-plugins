#!/bin/bash
REPL="mainnet"
CHART="ETHEREUM_${REPL}.chart.py"
CONF="ETHEREUM_${REPL}.conf"
HEALTH_EXE="ETHEREUM_${REPL}.health_execution.conf"
HEALTH_CON="ETHEREUM_${REPL}.health_consensus.conf"
UPDATE="ETHEREUM_${REPL}.update.sh"

cat ETHEREUM_NETWORK.chart.py | sed "s/ETHEREUM_NETWORK/$REPL/g" > $CHART
cat ETHEREUM_NETWORK.conf | sed "s/ETHEREUM_NETWORK/$REPL/g" > $CONF 
cat ETHEREUM_NETWORK.health_execution.conf | sed "s/ETHEREUM_NETWORK/$REPL/g" > $HEALTH_EXE 
cat ETHEREUM_NETWORK.health_consensus.conf | sed "s/ETHEREUM_NETWORK/$REPL/g" > $HEALTH_CON
cat ETHEREUM_NETWORK.update.sh | sed "s/ETHEREUM_NETWORK/$REPL/g" > $UPDATE
chmod u+x $UPDATE
