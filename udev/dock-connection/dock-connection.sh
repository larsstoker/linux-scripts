#!/bin/bash

ACTION=${1}
LOCK=$HOME/fprintd-disabled

if [[ "$ACTION" =~ "add" ]]
  then
    logger -s "docking station connected"
    touch "$LOCK"
    systemctl stop fprintd
    systemctl mask fprintd
    logger -s "stopped and disabled fprintd"
elif [[ "$ACTION" =~ "remove" ]]
  then
    logger -s "docking station disconnected"
    systemctl unmask fprintd
    systemctl start fprint
    rm "$LOCK"
    logger -s "started and enabled fprintd"
fi

exit 0