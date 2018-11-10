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
- it will take care of setting your some variables for you,
  like PATH, MANPATH, and LIBPATH
- it will source a file called `profile` in your home directory
