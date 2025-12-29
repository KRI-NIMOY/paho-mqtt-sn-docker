# Eclipse Paho MQTT-SN Transparent / Aggregating Gateway

This docker image contains custom builds of Eclipse Paho MQTT-SN Gateway for multiple protocols. Images for ARM platforms are supported.

[MQTT-SN protocol](http://www.mqtt.org/new/wp-content/uploads/2009/06/MQTT-SN_spec_v1.2.pdf) requires a MQTT-SN Gateway which acts as a protocol converter to convert MQTT-SN messages to MQTT messages. MQTT-SN client can not communicate directly with MQTT broker (TCP/IP). You can find more information on [project GitHub](https://github.com/eclipse/paho.mqtt-sn.embedded-c/tree/master/MQTTSNGateway).

## Available Image Tags

The Docker images are built for both **xbee** and **udp** protocols with the following tags:

- `latest` - Latest xbee protocol version (default)
- `master` - Master branch xbee protocol version (same as latest)
- `xbee` - Latest xbee protocol version
- `udp` - Latest udp protocol version
- `latest-xbee` - Latest xbee protocol version
- `latest-udp` - Latest udp protocol version
- `master-xbee` - Master branch xbee protocol version
- `master-udp` - Master branch udp protocol version
- `sha-<commit>-xbee` - Specific commit xbee version
- `sha-<commit>-udp` - Specific commit udp version
- `v*.*.*-xbee` - Tagged release xbee version
- `v*.*.*-udp` - Tagged release udp version

## Build docker image

Clone the repository with `--recursive`

```
git submodule update
docker build [--build-arg PROTOCOL=<protocol>] .
```

Following protocols are supported:
* xbee (default for published images)
* udp
* udp6
* dtls
* dtls6
* loralink

Note: Published Docker images are available for xbee and udp protocols. Other protocols can be built manually using the build argument.

## Using the image

### Using default configuration

Run gateway with default configuration (xbee protocol). By default application is listening on port 10000 and connects to broker [mqtt.eclipse.org](https://mqtt.eclipse.org/).

```
docker run -d -p 10000:10000 -p 10000:10000/udp ghcr.io/kri-nimoy/paho-mqtt-sn-docker
```

To use the UDP protocol version instead:

```
docker run -d -p 10000:10000 -p 10000:10000/udp ghcr.io/kri-nimoy/paho-mqtt-sn-docker:udp
```

### Using custom MQTT broker settings

Run gateway with custom settings of MQTT broker IP address and port.

```
docker run -d -p 10000:10000 -p 10000:10000/udp ghcr.io/kri-nimoy/paho-mqtt-sn-docker --broker-name $HOST --broker-port $PORT
```

Modify $HOST to the target MQTT broker hostname or IP address and $PORT to target broker port number.

### Using custom configuration

Run gateway with custom configuration on filesystem. You can adjust default configuration template from [Eclipse project GitHub](https://github.com/eclipse/paho.mqtt-sn.embedded-c/blob/master/MQTTSNGateway/gateway.conf)

```
docker run -d -p 10000:10000 -p 10000:10000/udp -v $PWD/gateway.conf:/etc/paho/gateway.conf:ro ghcr.io/kri-nimoy/paho-mqtt-sn-docker
```

Modify $PWD to the directory where you stored the configuration file.