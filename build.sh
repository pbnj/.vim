#!/bin/sh

if hash apt >/dev/null 2>&1; then
	apt-get install ninja-build gettext cmake unzip curl git
else
	apk add build-base cmake coreutils curl unzip gettext-tiny-dev git
fi

git clone https://github.com/neovim/neovim /tmp/neovim
git -C /tmp/neovim checkout stable
make -C /tmp/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
make -C install
