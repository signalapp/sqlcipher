#!/bin/sh
set -eu

repo_root=$(cd "$(dirname "$0")" && pwd)
build_dir=$(mktemp -d)
trap 'rm -rf "$build_dir"' EXIT

cd "$build_dir"
"$repo_root/configure" --with-crypto-lib=commoncrypto --disable-tcl > /dev/null
make sqlite3.c > /dev/null

cp sqlite3.c "$repo_root/Sources/SQLCipher/sqlite3.c"
cp sqlite3.h "$repo_root/Sources/SQLCipher/include/sqlite3.h"
