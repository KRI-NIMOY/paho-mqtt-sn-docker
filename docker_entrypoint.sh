#!/bin/sh

# getid() {
#    ps aux | grep -v grep
# }

# GW_ID="$(getid)"

# function parse_args()
# {
#     while [ $# -gt 0 ]
#     do
#         echo $1
#         case $1 in
#         --broker-name)
#             echo $2
#             BROKER_NAME=$2
#             shift
#             shift
#             ;;
#         --broker-port)
#             echo $2
#             BROKER_PORT=$2
#             shift
#             shift
#             ;;
#         --gw-id)
#             echo $2
#             GW_ID=$2
#             shift
#             shift
#             ;;
#         --gw-name)
#             echo $2
#             GW_NAME=$2
#             shift
#             shift
#             ;;
#         --xbee-dev)
#             echo $2
#             XBEE_DEV=$2
#             shift
#             shift
#             ;;
#         *)
#             shift
#             ;;
#         esac
#     done
# }

# parse_args "$@"

# PAHO_CONF="/etc/paho/gateway.conf"

# if ! [ -z ${BROKER_NAME+x} ]; then sed -i "s/^BrokerName.*$/BrokerName=$BROKER_NAME/" $PAHO_CONF; fi
# if ! [ -z ${BROKER_PORT+x} ]; then sed -i "s/^BrokerPortNo.*$/BrokerPortNo=$BROKER_PORT/" $PAHO_CONF; fi
# if ! [ -z ${GW_ID+x} ]; then sed -i "s/^GatewayID.*$/GatewayID=$GW_ID/" $PAHO_CONF; fi
# if ! [ -z ${GW_NAME+x} ]; then sed -i "s/^GatewayName.*$/GatewayName=$GW_NAME/" $PAHO_CONF; fi
# if ! [ -z ${XBEE_DEV+x} ]; then sed -i "s/^SerialDevice.*$/SerialDevice=$XBEE_DEV/" $PAHO_CONF; fi

/usr/local/sbin/MQTT-SNGateway -f /etc/paho/gateway.conf
