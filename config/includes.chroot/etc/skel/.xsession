#!/bin/sh
LANG=ja_JP.UTF-8 ; export LANG
EDITOR=vim; export EDITOR
XMODIFIERS=@im=ibus ; export XMODIFIERS
xrdb -merge .Xresources
x-session-manager
