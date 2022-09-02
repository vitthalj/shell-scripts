#!/bin/bash
allServices=("service1" "service2" "service3" "service4")
for service in ${allServices[@]}; do 
echo $service
STATUS="$( systemctl is-active $service )"
  RUNNING="$( systemctl show -p SubState $service | cut -d'=' -f2 )" 
        if [ "${STATUS}" = "active" ]; then
        echo "$service Service is Active"
                if [ "${RUNNING}" = "running" ]; then
                        echo "$service Service is Running"
                else
                        echo "$service Service Not Running"
                fi
       else
                echo "$service Service not Active "
                exit 1
        fi
done
