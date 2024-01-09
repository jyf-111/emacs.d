(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hideshow
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode)
  :bind (("C-c C-h" . hs-hide-all)
	 ("C-c C-s" . hs-show-all)))

(use-package igist
  :bind (("M-o" . igist-dispatch)))

(provide 'init-prog)
