(setenv "TERM" "xterm-256color")

(electric-pair-mode t)                       ; 自动补全括号
(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(auto-save-mode 1)                           ; （可选）打开自动保存
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq make-backup-files nil)                 ; 关闭文件自动备份
(fset 'yes-or-no-p 'y-or-n-p)
(pixel-scroll-precision-mode 1)
(setq default-frame-alist (append default-frame-alist '((alpha-background . 70))))

(add-hook 'prog-mode-hook (lambda ()
			    (setq show-paren-mode t)
			    (setq hs-minor-mode t)
			    (setq display-line-numbers-type 'relative)
			    (display-line-numbers-mode t)))

(defun open-emacs-config ()
  "Open the Emacs configuration file."
  (interactive)
  (find-file "~/.config/emacs/elisp"))


(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :bind (:map prog-mode-map
         ("C-c TAB" . hs-toggle-hiding)
         ("M-+" . hs-show-all))
  :hook (prog-mode . hs-minor-mode)
  :custom
  (hs-special-modes-alist
   (mapcar 'purecopy
           '((c-mode "{" "}" "/[*/]" nil nil)
             (c++-mode "{" "}" "/[*/]" nil nil)
             (rust-mode "{" "}" "/[*/]" nil nil)))))

(use-package whitespace
  :ensure nil
  :hook ((prog-mode markdown-mode conf-mode) . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing)))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode 1))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(use-package isearch
  :ensure nil
  :bind (:map isearch-mode-map
         ([remap isearch-delete-char] . isearch-del-char))
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "%s/%s ")
  (lazy-highlight-cleanup nil))

(provide 'init-general)
