
# ROS+Docker: Configuration notes

## General setup

All the configuration for the docker containers I use is under
`~/ros/docker`. Every container gets its own directory, and under each
directory there usually is a `Dockerfile` and a shell script
(e.g. `run.sh`) that runs the container with the appropriate
command-line options to `docker run`.

All containers are based on the Ubuntu image from the Docker
repository. The Ubuntu release is the one supported by the ROS release
we're currently on (currently: ROS Indigo, on Ubuntu 14.04). Whenever
it's needed, I'm also using Team DIANA's custom ROS Docker image (it
contains some additional libraries, such as a recent build of Boost).

## Container host name visible on the host

This works in two parts. First, a Python script named `dockerdns.py`
writes the hostname-IP address mappings to the file
`/etc/hosts.docker`, in the same format of `/etc/hosts`. I call this
script manually, every time the IP address corresponding to an
hostname changes, or a new container is started.

Then, I've configured NetworkManager to work through dnsmasq, acting
as a DNS caching server. This is not a hack, it's supported by
NetworkManager, and it's enabled by simply adding the line
`dns=dnsmasq` to the `[main]` section of
`/etc/NetworkManager/NetworkManager.conf`. Mine currently looks like
this:

> [main]
> plugins=ifcfg-rh,ibft
> dns=dnsmasq
>
> [logging]
> #level=DEBUG

Then, I've configured dnsmasq to use the generated `hosts.docker` file as an additional hosts file (alongside `/etc/hosts`). This is done by adding the line:

> addn-hosts=/etc/hosts.docker

to a new configuration file under the directory
`/etc/NetworkManager/dnsmasq.d/`. I've given it the name
`10-addn-hosts.conf`, but any name will do as long as the file is
under that path. Note that the directory is not dnsmasq's default
(`/etc/dnsmasq.d/`): when NetworkManager starts dnsmasq, it makes it
load its configuration from that other directory.


## Hostname set to the container name

It appears that containers outside the one where the ROS core is
running must be reachable through their own hostname. When starting a
new container, Docker sets its hostname to a short-form of its UUID
(e.g. `e3a0e4cb2f39`). Also, Docker configures each container so that
it can reach every other container using that container's name
(e.g. the one you set with the `--name` option) as hostname (not the
actual hostname, the short UUID above). (The host can use both the
container's name and the short-UUID hostname thanks to
the`dockerdns.py`script, see above).

To solve this situation, I use the `--hostname` option (to the
`docker-run` command) to set each container's hostname to its
name.
