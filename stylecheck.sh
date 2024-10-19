#!/bin/bash

die() {
  echo "Usage: $0 'repo_name' [ignore]"
        echo "repo_name: the name of the repo to test, i.e. 'apid'"
        echo "ignore: a comma separated list of errors to ignore, i.e. 'E202,E123'"
  exit 1
}

MAX_LINE_LENGTH=${MAX_LINE_LENGTH:-120}

REPO=$1

[[ $REPO ]] || die

IGNORE=$2

ROOT=$TARGET_ROOT
if [[ $ROOT ]]; then
  echo "WARNING: TARGET_ROOT environment variable is not set"
  ROOT=.
fi
pushd $ROOT >/dev/null

# i ignore E202 (whitespace before '}')

echo "==== flake8 checks on $REPO ===="
# errors to ignore for the ops-apid: E501,E126,E301,F841,E303,E127,E731,E401,F401,E265,E302,W391
out1=$(flake8 --max-line-length $MAX_LINE_LENGTH --ignore=E202,E123,$IGNORE $REPO)
__rt=$?
if [[ ! $out1 ]]; then
    echo "CLEAN"
else
    echo "$out1"
fi


popd >/dev/null
exit $__rt
