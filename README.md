# netdata plugins
Repo contains own developed plugins for netdata.

## Logging configuration
### syslog
Define log file locations for local facilities in `/etc/rsyslog.d/50-default.conf`:
```
local0.*                        -/mydata/log/local0.log
```
Restart syslog: 
```
systemctl restart rsyslog
```

### docker-compose
Configure for each relevant docker container to log to syslog. Also adapt log facility and tag, if needed:
```
    logging:
      driver: syslog
      options:
        syslog-facility: local0
        tag: tezos-node
```

## Configuration
Open `convert.sh` and adapt variable $REPL. Afterwards you can execute `convert.sh` and the script will generate the netdata files and a deployment script (*.update.sh).

Run the deployment script and the corresponding files are installed in the correct directories.

Edit 'health_alarm_notify.conf' and copy the file to /etc/netdata/

Restart netdata service: `systemctl restart netdata`

## Testing alarm notifications
https://learn.netdata.cloud/docs/alerts-&-notifications/notifications/agent-dispatched-notifications/agent-notifications-reference#testing-alert-notifications
