#!/bin/bash
# This script is designed to run tests on a specified repository, generate coverage reports, and output the result in various formats. 
die() {
        echo "Usage: $0 'repo_name'"
        echo "repo_name: the name of the repo to test, i.e. 'apid'"
        exit 1
}

REPO=$1

[[ $REPO ]] || die

ROOT=$TARGET_DIRECTORY
if [[ $ROOT ]]; then
  echo "WARNING: TARGET_DIRECTORY environment variable is not set"
  ROOT=.
fi
pushd $ROOT >/dev/null

PYTHONPATH=target-common/:$REPO/ coverage run $(which trial) --reporter subunit target-common/target $REPO | subunit-1to2 | subunit2junitxml --no-passthrough --output-to=$ROOT/output.xml

coverage report --include "target-common*","$REPO" --omit "*test*"
coverage xml --include "target-common*","$REPO*" --omit "*test*"

rm -rf _trial_temp .coverage

popd >/dev/null