(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 (c-ts-mode . lsp-deferred)
	 (c++-ts-mode . lsp-deferred)
	 (python-ts-mode . lsp-deferred)
	 (rust-ts-mode . lsp-deferred)
	 (go-ts-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)
  )
  :commands (lsp lsp-deferred)
  :config (setq lsp-auto-guess-root t))

(use-package flycheck
  :custom
  (truncate-lines nil)
  :hook
  (prog-mode . flycheck-mode))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
