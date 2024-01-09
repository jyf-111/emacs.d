(use-package crux)
(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

(use-package multiple-cursors
  :defer t
  :config
  (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir)) ;; 有些命令会询问是否应用到所有光标，然后该命令的 是/否 会被缓存到这个文件中
  :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package ace-pinyin
  :init
  (use-package avy
    :bind (("C-l" . avy-goto-char-2)
	   ("C-c C-j" . avy-resume)) ;; 复用上一次搜索
    :custom
    (avy-all-windows t)
    (avy-timeout-seconds 0.3))
  :config (ace-pinyin-global-mode +1))

(use-package mwim
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(provide 'init-edit)
