#!/bin/sh

RED='\033[0;34m'
NC='\033[0m'

printf "${RED}$1${NC}\n"

sudo diff $1 ${1%.*}

