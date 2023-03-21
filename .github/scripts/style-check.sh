#!/bin/bash

set -xe

. $(dirname "$0")/common.sh

export RUSTFLAGS="-D warnings"

pushd $BINDING_PATH/mmtk
cargo clippy || exit $?
cargo clippy --release || exit $?

cargo fmt -- --check || exit $?
popd

find $BINDING_PATH/openjdk \
    $BINDING_PATH/mmtk \
    -name '*.hpp' \
    -o -name '*.cpp' \
    -o -name '*.rs' \
    -o -name '*.toml' \
    -o -name '*.gmk' \
    -exec $(dirname "$0")/check-lineends.sh '{}' \;

