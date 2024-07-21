#!/bin/bash
set -e
mkdir -p ~/git/dby-pghacker
cd ~/git/dby-pghacker
if [ ! -d webhook ]; then
	git clone https://github.com/dby-pghacker/webhook
fi
cd webhook

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
[ "${ARCH}" = "x86_64" ] && ARCH=amd64
curl -L "https://github.com/adnanh/webhook/releases/latest/download/webhook-${OS}-${ARCH}.tar.gz" | tar -xzv
mkdir -p /tmp/dispatch_webhook
cp dispatch.sh /tmp/dispatch_webhook/
cd "webhook-${OS}-${ARCH}"
./webhook -hooks ./hooks.yaml -verbose
