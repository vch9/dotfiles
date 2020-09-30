;; Show lines
(global-linum-mode 1)

;; Show columns
(setq column-number-mode t)

;; Hide menu
(menu-bar-mode -1)

;; Hide tool-bar
(tool-bar-mode -1)

;; Emacs theme
(load-theme 'cyberpunk t)

;; Move save files
(setq backup-directory-alist `(("." . "~/.saves")))

;; Show line at column 80
(add-hook 'after-change-major-mode-hook 'fci-mode)                    
(setq fci-rule-column 80)

;; Remove white space
(autoload 'whitespace-mode
  "whitespace"
  "Toggle whitespace visualization." t)
