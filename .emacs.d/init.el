;; MELPA installing
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Remove start up message
(setq inhibit-startup-message t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package fill-column-indicator
  :ensure t)

(use-package whitespace
  :ensure t)

(use-package org
  :ensure t)

(use-package scala-mode
  :ensure t)

(use-package company
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t)

(use-package lsp-metals
  :ensure t)

(use-package lusty-explorer
  :ensure t)

(use-package magit
  :ensure t)

(use-package drag-stuff
  :ensure t)

(use-package highlight-symbol
  :ensure t)

(use-package treemacs
  :ensure t)

(use-package winum
  :ensure t)

(use-package iedit
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; This is a horrible solution, fix-me please
(add-to-list 'load-path "/home/valentin/Documents/tezos/master/_opam/share/emacs/site-lisp/")
(load "/home/valentin/Documents/tezos/master/_opam/share/emacs/site-lisp/tuareg-site-file")
