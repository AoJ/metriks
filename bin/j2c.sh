#!/usr/bin/env bash
set -x
set -e
js2coffee --single_quotes --verbose ${1} > ${1%%.*}.coffee
rm ${1}


