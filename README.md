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

`home` aims at solving that.

<h2 align="center">Demo</h2>
<p align="center"><img src="https://gl.githack.com/shellm/home/raw/master/demo/demo.svg"></p>

## Installation
Installation is done with [basher](https://github.com/basherpm/basher):

```bash
basher install gitlab.com/shellm/home
```

## Usage

1. choose a location on your disk
2. initialize your home there
3. load your home environment whenever you need it, or...
4. (optional) add two lines in `~/.bashrc`
   to load it automatically each time you open your console.

I know, I know, again adding lines in `.bashrc`.
But the goal here is to move all the previously appended lines
to your home, so you don't have to mess with `.bashrc` anymore!

Since `home` depends on [`shellm`](https://github.com/shellm-org/core),
which itself depends on [`basher`](https://github.com/basherpm/basher),
the minimal set of lines that you have to put in `.bashrc` is the following:

```bash
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init -)"
eval "$(home init - /path/to/my/home)"
```

And it will not grow anymore!

Now put all your shell environment and configuration
in your `/path/to/my/home` directory, put it under `git`,
and voilà!

> OK, but I could have done that in one line, like `. /path/to/my/env/startup`...

Indeed, so what does `home` really bring here? Well:

- it comes with handy commands allowing you to manipulate your data,
- it autocompletes with the contents of your home so you can quickly
  run commands on your files: `home vim bin/my_script`
- it will take care of setting your PATH variable
