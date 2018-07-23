#!/bin/bash

# Shells used for compatibility tests. Remove this line to test against all
# possible shells if installed: ash, bash, bosh, bsh, csh, dash, fish, ksh,
# mksh, pos,h scsh, sh, tcsh, xonsh, yash, and zsh.
export SHELLS="bash-4.4.12 zsh-5.4.2"

# Variables used in tests.
scripts=$(file bin/* | grep 'shell script' | cut -d: -f1)
libs=$(find lib -name '*.sh')
success=0
failure=1
