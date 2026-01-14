#!/bin/sh

set -exu

export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo

# Add your additional provisioning here for custom VM images.
pkg update && pkg upgrade && pkg install -y git
mkdir -p /opt/sysroot/arm64
curl -sSf https://download.freebsd.org/ftp/releases/arm64/14.3-RELEASE/base.txz | tar -C /opt/sysroot/arm64 -xJ lib usr/lib
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.92.0
/opt/rust/cargo/bin/rustup target add x86_64-unknown-freebsd i686-unknown-freebsd
/opt/rust/cargo/bin/rustup component add rust-src
