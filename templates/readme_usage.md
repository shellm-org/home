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
