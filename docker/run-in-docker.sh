#!/bin/sh

set -eux -o pipefail

PATH=$PATH:/root/.cargo/bin

echo "Generating book"
mdbook build -d /book

echo "Starting webserver"
nginx -g 'daemon off;'