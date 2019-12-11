;; ajouter le répertoire emacs d'opam
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; charger le mode merlin
(require 'merlin)

;; lancer merlin sur les fichiers OCaml
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

;; activer auto-complete
(setq merlin-use-auto-complete-mode 'easy)

;; utiliser opam avec merlin
(setq merlin-command 'opam)

;; des raccourcis pratiques
(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'next-error)

;; pour avoir des raccourcis C-c C-v C-x pour le copier-coller
(custom-set-variables '(cua-mode t nil (cua-base)))
