# .vim

> My .vim configurations

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Overview](#overview)
- [Install](#install)
- [Install/Update Plugins](#installupdate-plugins)
- [Custom Plugins](#custom-plugins)
- [Filetype Plugins](#filetype-plugins)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Overview

My personal `vim` configuration, focusing on minimalism without compromising
pragmatism and functionality.

Notable features include:

- [`vim-plug`](https://github.com/junegunn/vim-plug) vim plugin manager
- [`ale`](https://github.com/dense-analysis/ale) asynchronous linting engine,
  with zero-config LSP support
- [`fzf.vim`](https://github.com/junegunn/fzf.vim) fuzzy finder plugin
- [`vim-fugitive`](https://github.com/tpope/vim-fugitive) git plugin
- ... and many more

## Install

```sh
git clone https://github.com/pbnj/.vim ~/.vim
```

## Install/Update Plugins

```sh
:PlugUpdate
```

## Custom Plugins

See [`./plugin/`](./plugin/)

## Filetype Plugins

See [`./after/ftplugin/`](./after/ftplugin/)

## License

MIT
