#!/bin/bash
REPL="ghostnet"
CHART="TEZOS_${REPL}.chart.py"
CONF="TEZOS_${REPL}.conf"
HEALTH="TEZOS_${REPL}.health.conf"
HEALTH_ATT="TEZOS_${REPL}.health_attestations.conf"
UPDATE="TEZOS_${REPL}.update.sh"

cat TEZOS_NETWORK.chart.py | sed "s/TEZOS_NETWORK/$REPL/g" > $CHART
cat TEZOS_NETWORK.conf | sed "s/TEZOS_NETWORK/$REPL/g" > $CONF 
cat TEZOS_NETWORK.health.conf | sed "s/TEZOS_NETWORK/$REPL/g" > $HEALTH 
cat TEZOS_NETWORK.health_attestations.conf | sed "s/TEZOS_NETWORK/$REPL/g" > $HEALTH_ATT 
cat TEZOS_NETWORK.update.sh | sed "s/TEZOS_NETWORK/$REPL/g" > $UPDATE
chmod u+x $UPDATE
