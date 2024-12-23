#!/bin/bash
set -ex
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"
export MSYS_NO_PATHCONV=1
docker rm -f scylla || true
docker run --volume "$PWD/.db:/var/lib/scylla" --name scylla -d scylladb/scylla:6.2

docker rm -f data-explorer || true
docker run --name data-explorer -d gesellix/nf-data-explorer@sha256:c1f36d28c00c5bb562fd275122e866b65e00a4df0c3046b35a7f3f8700c2a177
