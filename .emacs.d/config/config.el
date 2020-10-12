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
(setq org-agenda-files (quote ("/home/valentin/org/todo.org")))

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
      '(("t" "todo" entry (file+headline "/home/valentin/org/todo.org" "Tasks")
         "* TODO [#A] %?")))

;; Change lsp file
(setq config-file "~/.emacs.d/config/lsp.el")
(load config-file)

;; Scala indentation
(setq scala-indent:step 4)

;; Lusty explorer
(lusty-explorer-mode)

(add-hook 'lusty-setup-hook 'my-lusty-hook)
(defun my-lusty-hook ()
  (define-key lusty-mode-map (kbd "TAB") 'lusty-highlight-next-column)
  (define-key lusty-mode-map (kbd "<backtab>") 'lusty-highlight-previous-column)
  (define-key lusty-mode-map (kbd "RET") 'lusty-open-this))
