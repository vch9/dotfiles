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

(use-package cyberpunk-theme
  :ensure t)

(use-package fill-column-indicator
  :ensure t)

(use-package whitespace
  :ensure t)
