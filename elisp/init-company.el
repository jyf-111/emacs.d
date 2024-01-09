(use-package company
  :init (global-company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  (company-idle-delay 0.0)
  (company-show-numbers t)
  (company-selection-wrap-around t)
  (company-transformers '(company-sort-by-occurrence)))

(use-package company-box
  :if window-system
  :after company
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (use-package yasnippet-snippets)) 

(provide 'init-company)
