;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-
;;; init.el
;;
;; Copyright(C) 2012-2015 Youhei SASAKI All rights reserved.
;;
;; Author: Youhei SASAKI <uwabami@gfd-dennou.org>
;; Keywords:
;;
;; License: WTFPL
;;
;;; Code:
;; -----------------------------------------------------------
;; おまじない
(eval-when-compile (require 'cl))
;; 極力 UTF-8 を使用. 過去の資源(特に TeX 関連)には
;; euc-japan のモノも多いので注意すること.
;;
(set-language-environment "Japanese")
(set-language-environment-coding-systems "Japanese")
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
;; ------------------------------------
;; \C-h -> BS にする.
(global-set-key (kbd "C-h") 'backward-delete-char)
;;; 日本語入力 -> mozc
(eval-and-compile (require 'mozc))
(setq default-input-method "japanese-mozc")
