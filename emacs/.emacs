;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; ajout de melpa aux packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;; Change custom file
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

;; Pour que emacs soit moins chiant
(setq inhibit-startup-screen t)   ;; écran de démarrage
(global-linum-mode 1)                   ;; Affiche les numéros de ligne sur le coté
(setq linum-format "%4d ")



(setq-default indent-tabs-mode nil)     ;; Mode d'indentation avec tab
(setq tab-width 2)                      ;; taille des tabulations en espaces
;;(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize la taille
(scroll-bar-mode -1)                    ;; Efface la barre de defilement
(electric-indent-mode 1)                ;; auto indentation
;;(electric-pair-mode 1)                  ;; Permet d'avoir deux parenthèses ()
(menu-bar-mode -1)                      ;; enlever le menu en haut
(tool-bar-mode -1)                      ;; enlever la barre d'outils
(ac-config-default)                     ;; mode autocomplétion avec TAB
(delete-selection-mode 1)               ;; overwrite selected area

;; Ocaml
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")

(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'next-error)

;; Lsp
(require 'lsp-mode)
(add-hook 'ocaml-mode-hook #'lsp)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Ctrlp for emacs bofbof
;;(require 'ido)
;;(ido-mode t)

;; Git
(global-diff-hl-mode) ;; Highlights uncommited changes on the fly
