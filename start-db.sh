#!/bin/bash
set -ex
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"
export MSYS_NO_PATHCONV=1
docker rm -f scylla || true
docker run --volume "$PWD/.db:/var/lib/scylla" --name scylla -p 0.0.0.0:9042:9042 -d scylladb/scylla:6.2


