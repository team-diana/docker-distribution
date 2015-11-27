
# Team DIANA's Docker Development Distribution

Here at **Team DIANA** we really care about the comfort of our
developers, both expert and newcomers, and we're painfully aware that
the ROS roboticist's life is full of annoyances, traps, and plain
bullshit: the operating system must be the correct version, system
dependencies must be installed, scripts must be written and placed in
the appropriate path, that path must be written to the appropriate
environment variables, and then ROS packages must be built, installed,
configured, updated and wired together. For this reason, we've been
hard at work to apply the best-of-breed among the newer technologies
to this particularly painful use case.

The result is *Team DIANA's Docker Development Distribution*, a simple
collection of configuration files and scripts that, together with the
awesome [Docker](https://www.docker.com/), allow you to start a Linux
container already set up and ready to be used as a development
container.

## Now, seriously.

These are the containers I've been using for my own development
activity with Team DIANA. They've been only tested as far as my
workflow is concerted. They only work on Linux (btw, testing with
boot2docker would be interesting). Each can be started using the
`run.sh` script in the respective directory, e.g.:

```sh
$ sh heightmap/run.sh
```

All the scripts accept options in the form of environment
variables. At the moment, the accepted ones are:

* `command`: The command to execute inside the container. The default
depends on the particular container.

* `src_volume`: The directory to mount as a volume in the `/usr/src`
  directory in the container. All of the containers which require
  access to Team DIANA's source code expect to find it under
  `/usr/src` in the container. The default is `/mnt/lxc/ros-src` which
  may only make sense on my particular development machine, so you
  may want to change it before starting.

Each option can be set through Bash's dedicated syntax or the `env`
command:

```sh
# Like this
$ src_volume=~/ros-src sh heightmap/run.sh
# or like this
$ env command=/bin/bash src_volume=~/ros/src sh gazebo/run.sh
```

If anything misbehaves or is downright broken, feel free to disturb me
anytime (you'll have to find my email address for yourself, because of
the goddamn spam).
