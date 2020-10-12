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

;; Org mode
;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;file to save todo items
(setq org-agenda-files (quote ("/home/valentin/todo.org")))

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/home/valentin/todo.org" "Tasks")
         "* TODO [#A] %?")))
