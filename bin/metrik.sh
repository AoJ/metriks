#!/usr/bin/env bash
# set -x
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname ${DIR})"
${ROOT}/node_modules/coffee-script/bin/coffee ${DIR}/metriks.coffee
