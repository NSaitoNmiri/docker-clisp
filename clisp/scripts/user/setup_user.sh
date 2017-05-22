#!/usr/bin/env bash

set -eu

echo export LANG=ja_JP.UTF-8 >> ${HOME}/.profile
echo export LANGUAGE=ja_JP:ja >> ${HOME}/.profile
echo LV="-Au8" >> ${HOME}/.profile
cat << EOS >> ${HOME}/.vimrc
:set fenc=utf-8
:set fencs=iso-2022-jp,euc-jp,cp932,utf-8
:set enc=utf-8
EOS

## install Common LISP (http://blog.livedoor.jp/s-koide/tag/SBCL)

echo "(require :sb-aclrepl)" > $(HOME)/.sbclrc
curl -O https://beta.quicklisp.org/quicklisp.lispc
curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
gpg --verify quicklisp.lisp.asc quicklisp.lisp

# 最初だけインストールしておく
# sbcl --load quicklisp.lisp
# (quicklisp-quickstart:install)
# (ql:add-to-init-file)

exit 0
