# home
A home for your scripts.

- Authors: https://gitlab.com/shellm/home/AUTHORS.md
- Changelog: https://gitlab.com/shellm/home/CHANGELOG.md
- Contributing: https://gitlab.com/shellm/home/CONTRIBUTING.md
- Documentation: https://gitlab.com/shellm/home/wiki
- License: ISC - https://gitlab.com/shellm/home/LICENSE

## Installation
Installation with [basher](https://github.com/basherpm/basher):
```bash
basher install shellm/home
```

Installation from source:
```bash
git clone https://gitlab.com/shellm/home
cd home
sudo ./install.sh
```

## Usage
Command-line:
```
home -h
```

As a library:
```bash
# with basher's include
include shellm/home lib/home.sh
# with shellm's include
shellm-source shellm/home lib/home.sh
```
