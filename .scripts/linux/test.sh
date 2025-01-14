#!/bin/bash
set -e
set -x

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR=$SCRIPT_DIR/../../
cd $REPO_DIR

cd test
python3 run_tests.py -f --epsilon 1e-3 --include_flatbuffers

cd ../build
ctest --verbose --output-on-failure
