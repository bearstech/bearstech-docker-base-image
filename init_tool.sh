#!/usr/bin/env bash

set -eux

test -S /var/run/docker.sock
test -d /work

/bin/sh -c "make -C /work $*"
