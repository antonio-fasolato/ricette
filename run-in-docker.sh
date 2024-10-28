#!/bin/sh

PATH=$PATH:/root/.cargo/bin

echo "Installing dependencies"
npm install

echo "Generating book"
mdbook build -d /book

echo "Injecting PWA code"
npx workbox injectManifest workbox-config-docker.js

echo "Starting webserver"
npx quick-serve /book