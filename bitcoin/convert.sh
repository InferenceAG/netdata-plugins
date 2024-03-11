#!/bin/bash
REPL="mainnet"
CHART="BITCOIN_${REPL}.chart.py"
CONF="BITCOIN_${REPL}.conf"
HEALTH="BITCOIN_${REPL}.health.conf"
UPDATE="BITCOIN_${REPL}.update.sh"

cat BITCOIN_NETWORK.chart.py | sed "s/BITCOIN_NETWORK/$REPL/g" > $CHART
cat BITCOIN_NETWORK.conf | sed "s/BITCOIN_NETWORK/$REPL/g" > $CONF 
cat BITCOIN_NETWORK.health.conf | sed "s/BITCOIN_NETWORK/$REPL/g" > $HEALTH 
cat BITCOIN_NETWORK.update.sh | sed "s/BITCOIN_NETWORK/$REPL/g" > $UPDATE
chmod u+x $UPDATE

