(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package wakatime-mode
  :config (global-wakatime-mode))

(use-package fanyi)

(use-package counsel)
  
(use-package projectile
  :bind (("C-c p" . projectile-command-map))
  :custom
  (projectile-mode-line "Projectile")
  (projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :after projectile
  :init (counsel-projectile-mode))

(use-package ivy
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :custom
  (ivy-use-virtual-buffers t)
  (search-default-mode #'char-fold-to-regexp)
  (ivy-count-format "(%d/%d) ")
  (ivy-use-selectable-prompt t)
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight))
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package amx
  :init (amx-mode))

(use-package magit)

(use-package git-gutter
  :config (global-git-gutter-mode +1))

(use-package pdf-tools
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t))

(use-package mpdel
  :config
  (setq mpdel-prefix-key (kbd "C-. z")))

(use-package newsticker
  :config
  (setq newsticker-url-list '(("githubdaily" "https://rss.shab.fun/github/issue/GitHubDaily/GitHubDaily"))))

(provide 'init-tools)
