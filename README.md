[![Docker Repository on Quay.io](https://quay.io/repository/mh4nx7net/wowza-perpetual/status "Docker Repository on Quay.io")](https://quay.io/repository/mh4nx7net/wowza-perpetual)

> **NOTICE**:
>
> by this version. dont update to 4.8.0.

# mh4nx7net/wowza-perpetual:4.8.0

- [Introduction](#introduction)
  - [Contributing](#contributing)
  - [Issues](#issues)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Persistence](#persistence)
  - [Logs](#logs)
- [Maintainance](#maintenance)
  - [Upgrading](#upgrading)
  - [Shell Access](#shell-access)
- [References](#references)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Wowza Streaming Engine](http://www.wowza.com/products/streaming-engine).

This Dockerfile is not provided by or endorsed by Wowza Media Systems.

**NOTE**: By using this image you are agreeing to comply with the [Wowza EULA](https://www.wowza.com/legal)

Wowza Streaming Engine is unified streaming media server software developed by Wowza Media Systems. The server is used for streaming of live and on-demand video, audio, and rich Internet applications over IP networks to desktop, laptop, and tablet computers, mobile devices, IPTV set-top boxes, internet-connected TV sets, game consoles, and other network-connected devices.

## Contributing

inspired by sameersbn/wowza
then i'am sory. my fork and custumize is just for private project.
So clone me if you want


# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/mh4nx7net/wowza-perpetual) and is the recommended method of installation.

> **Note**: Builds are also available on [Quay.io](https://quay.io/repository/mh4nx7net/wowza-perpetual)

```bash
docker pull mh4nx7net/wowza-perpetual:4.8.0
docker run --name wowza -d --restart=always\
	--publish 1935:1935 --publish 8086:8086 \
	--publish 8087:8087 --publish 8088:8088 \
	--volume /srv/docker/wowza/data:/var/lib/wowza \
	--volume /srv/docker/wowza/log:/var/log/wowza \
	mh4nx7net/wowza-perpetual:4.8.0
```

Alternatively you can build the image yourself.

```bash
git clone https://github.com/mh4nx7net/wowza-perpetual.git
cd wowza-perpetual
make build
make up
```

## Configuration

Start with your own login page configuration:
* WO_USER: `admin`
* WO_PASS: `admin`
* WO_LICENSE: `ET1A4-KxrGd-Eaj9T-dTbcf-rZNza-9xaJd`

Point your browser to http://localhost:8088 and login using the default username and password:

Refer to the wowza [quickstart guide](http://www.wowza.com/forums/content.php?3-quick-start-guide) to get started with Wowza.


[Wowza - Letencrypt configuration](https://github.com/nlmaca/Wowza_Installers/blob/master/Ubuntu/Ubuntu_20.04_Letsencrypt.md)
[Wowza-4.8.0 - Linux Downloads](https://www.wowza.com/downloads/WowzaStreamingEngine-4-8-5/WowzaStreamingEngine-4.8.5-linux-x64-installer.run)


## Logs

The Wowza logs are populated in `/var/log/wowza`. You can mount a volume at this location to easily access these logs and/or perform log rotation.

Alternatively you can also use `docker exec` to tail the logs. For example,

```bash
tail -f /srv/docker/wowza/log/wowza/wowzastreamingengine_access.log
```

# Maintenance
## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `bash` using `docker exec`:

```bash
docker exec -it wowza_service bash
```

# References

  * https://www.wowza.com/legal
  * http://www.wowza.com/products/streaming-engine
