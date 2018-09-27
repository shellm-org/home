<p align="center">
  <img src="https://gl.githack.com/shellm/home/raw/master/logo.png">
</p>

<h1 align="center">A home for your shell scripts!</h1>

<p align="center">Your shell environment in one place. Easy to sync. Feel at home on any machine.</p>

<p align="center">
  <a href="https://gitlab.com/shellm/home/commits/master">
    <img alt="pipeline status" src="https://gitlab.com/shellm/home/badges/master/pipeline.svg" />
  </a>
  <!--<a href="https://gitlab.com/shellm/home/commits/master">
    <img alt="coverage report" src="https://gitlab.com/shellm/home/badges/master/coverage.svg" />
  </a>-->
  <a href="https://gitter.im/shellm/home">
    <img alt="gitter chat" src="https://badges.gitter.im/shellm/home.svg" />
  </a>
</p>

`home` helps you manage all your shell scripts and libraries in one place.
Putting them all in this one place allows easy synchronisation
between multiple machine by versioning the directory
with git or another version-control system.

## Motivation
I'll mainly speak about my own experience,
but I'm sure most of you can relate to it.

My usecases:

1. Since I moved to Linux, back in 2011,
   I grew quite a collection of shell scripts
   and personalised a lot my shell environment.
2. I use many different machines: remote servers, home computer,
   work computer, laptop, friends laptops, VMs.

My requirements:

1. I want to feel at home on each of these machine. I want my shell environment wherever I am.
2. I want it easily synced, and easily installed on new systems.

<h2 align="center">Demo</h2>
<p align="center"><img src="https://gl.githack.com/shellm/home/raw/master/demo/demo.svg"></p>

## Installation
Installation is done with [basher](https://github.com/basherpm/basher):

```bash
basher install gitlab.com/shellm/home
```

## Usage
If you want to use shellm in your current shell or in a script,
simply enter the following instruction
or add it at the beginning of your script:

```bash
source $(shellm-core-path)
```

You now have access to the `shellm-source` command
which allows you to source a file located somewhere in your `LIBPATH`.

Typically, for a package installed with basher:
```bash
shellm-source namespace/package
# or just a specific file:
# shellm-source namespace/package/lib/main.sh
```

For files listed in a personal directory, something like
```
/path/to/my/lib/
├── bookmark.sh
├── cd.sh
└── env
    ├── aliases.sh
    ├── completion.sh
    └── goenv.sh
```

...and `LIBPATH=/path/to/my/lib:$LIBPATH`:

```bash
shellm-source bookmark.sh
shellm-source env/aliases.sh
```
