;; Show lines
(global-linum-mode 1)

;; Show columns
(setq column-number-mode t)

;; iedit
(global-set-key (kbd "C-c ;") 'iedit-mode)

;; white-space mode
(setq-local whitespace-line-column 80)
(make-variable-buffer-local 'whitespace-style)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode 1)

;; Hide menu
(menu-bar-mode -1)

;; Hide tool-bar
(tool-bar-mode -1)

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
(setq lsp-file "~/.emacs.d/config/lsp.el")
(load lsp-file)

;; Change org file
(setq org-file "~/.emacs.d/config/org.el")
(load org-file)

;; Scala indentation
(setq scala-indent:step 2)

;; Lusty explorer
(lusty-explorer-mode)

(add-hook 'lusty-setup-hook 'my-lusty-hook)
(defun my-lusty-hook ()
  (define-key lusty-mode-map (kbd "TAB") 'lusty-highlight-next-column)
  (define-key lusty-mode-map (kbd "<backtab>") 'lusty-highlight-previous-column)
  (define-key lusty-mode-map (kbd "RET") 'lusty-open-this))


;; Dracula theme
;; Don't change the font size for some headings and titles (default t)
(setq dracula-enlarge-headings nil)

;; Adjust font size of titles level 1 (default 1.3)
(setq dracula-height-title-1 1.25)

;; Adjust font size of titles level 2 (default 1.1)
(setq dracula-height-title-1 1.15)

;; Adjust font size of titles level 3 (default 1.0)
(setq dracula-height-title-1 1.05)

;; Adjust font size of document titles (default 1.44)
(setq dracula-height-doc-title 1.4)

;; Use less pink and bold on the mode-line and minibuffer (default nil)
(setq dracula-alternate-mode-line-and-minibuffer t)

;; Copy/paste one line
(global-set-key "\C-q" "\C-a\C- \C-n\M-w\C-y")

;; Opening/closing parenths
(setq electric-pair-mode 1)

;; Activate OCaml Merlin by default
;(setq merlin-mode 1)

;; Kill all buffers at once
(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x C-K") 'nuke-all-buffers)

;; drag-stuff
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Reload buffers when changed on disk
(global-auto-revert-mode t)

;; Highlight mode
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Comment-uncomment
(global-set-key (kbd "C-x :") 'comment-or-uncomment-region)

;; Rebind tuareg command
(global-set-key (kbd "C-c <left>")  'tuareg-find-alternate-file)
(global-set-key (kbd "C-c <right>") 'tuareg-find-alternate-file)

;; Enable winum
(winum-mode)

;; mark-whole-word instead of mark-word
(defun mark-whole-word (&optional arg allow-extend)
  "Like `mark-word', but selects whole words and skips over whitespace.
If you use a negative prefix arg then select words backward.
Otherwise select them forward.

If cursor starts in the middle of word then select that whole word.

If there is whitespace between the initial cursor position and the
first word (in the selection direction), it is skipped (not selected).

If the command is repeated or the mark is active, select the next NUM
words, where NUM is the numeric prefix argument.  (Negative NUM
selects backward.)"
  (interactive "P\np")
  (let ((num  (prefix-numeric-value arg)))
    (unless (eq last-command this-command)
      (if (natnump num)
          (skip-syntax-forward "\\s-")
        (skip-syntax-backward "\\s-")))
    (unless (or (eq last-command this-command)
                (if (natnump num)
                    (looking-at "\\b")
                  (looking-back "\\b")))
      (if (natnump num)
          (left-word)
        (right-word)))
    (mark-word arg allow-extend)))

(global-set-key [remap mark-word] 'mark-whole-word)

;; Call compile
(global-set-key (kbd "C-x !") 'compile)
