#!/bin/bash

eval "$(basher init - bash)"

include shellm/shellm init.sh

scripts=$(file bin/* | grep 'shell script' | cut -d: -f1)
libs=$(find lib -name '*.sh')

success=0
failure=1
