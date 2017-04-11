#!/bin/bash

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOROOT
GOROOT=$(go env GOROOT)
