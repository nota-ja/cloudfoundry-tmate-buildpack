#!/usr/bin/env bash

LAUNCH_VERSION="$(git log -1 --oneline | awk '{print $1}') on $(uname -a)"
echo $LAUNCH_VERSION
sed -i".org" -e "s|UNKNOWN_VERSION|${LAUNCH_VERSION}|g" ./launch.go
go build -o launch ./launch.go
mv -f ./launch.go.org ./launch.go
