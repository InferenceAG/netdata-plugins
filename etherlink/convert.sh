#!/bin/bash
REPL="ghostnet"
CHART="ETHERLINK_${REPL}.chart.py"
CONF="ETHERLINK_${REPL}.conf"
HEALTH="ETHERLINK_${REPL}.health.conf"
HEALTH_EVM="ETHERLINK_${REPL}.evm_health.conf"
HEALTH_ROLLUP="ETHERLINK_${REPL}.rollup_health.conf"
UPDATE="ETHERLINK_${REPL}.update.sh"

cat ETHERLINK_NETWORK.chart.py | sed "s/ETHERLINK_NETWORK/$REPL/g" > $CHART
cat ETHERLINK_NETWORK.conf | sed "s/ETHERLINK_NETWORK/$REPL/g" > $CONF 
cat ETHERLINK_NETWORK.health.conf | sed "s/ETHERLINK_NETWORK/$REPL/g" > $HEALTH 
cat ETHERLINK_NETWORK.evm_health.conf | sed "s/ETHERLINK_NETWORK/$REPL/g" > $HEALTH_EVM 
cat ETHERLINK_NETWORK.rollup_health.conf | sed "s/ETHERLINK_NETWORK/$REPL/g" > $HEALTH_ROLLUP 
cat ETHERLINK_NETWORK.update.sh | sed "s/ETHERLINK_NETWORK/$REPL/g" > $UPDATE
chmod u+x $UPDATE
