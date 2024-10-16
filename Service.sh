#!/bin/bash

SERVICE="apache2"
LOGFILE="/var/log/service_monitor.log"

check_service() {
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running"
    else
        echo "$SERVICE is down, restarting..."
        systemctl start $SERVICE
        if [ $? -eq 0 ]; then
            echo "$SERVICE restarted successfully at $(date)" >> $LOGFILE
        else
            echo "Failed to restart $SERVICE at $(date)" >> $LOGFILE
        fi
    fi
}

check_service
