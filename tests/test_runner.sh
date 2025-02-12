#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

# Default to using /var/tmp for test space, since it's more likely to support
# labels than /tmp, which is often on tmpfs.
export TMPDIR=${TMPDIR:-/tmp}

function execute() {
	>&2 echo "++ $@"
	eval "$@"
}

# Run the tests.
execute time bats -j $(nproc) --tap "${@:-.}"
