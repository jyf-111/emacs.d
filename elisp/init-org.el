(use-package org
  :hook
  (org-mode . org-indent-mode)
  (org-mode . (lambda ()
		(setq truncate-lines nil)))
  :config
  (setq org-log-done 'time)
  (setq org-log-done 'note)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)")))
  (setq org-clock-into-drawer t)
  (setq org-image-actual-width (/ (display-pixel-width) 3))
  (setq org-startup-with-inline-images t)
  (setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
  (setq org-agenda-dir "~/org/Agenda")
  (setq org-agenda-files (list org-agenda-dir))
  (setq org-agenda-project-file (concat org-agenda-dir "/Project.org"))
  (setq org-agenda-todo-file (concat org-agenda-dir "/Todo.org"))
  (setq org-agenda-home-file (concat org-agenda-dir "/Home.org"))
  (setq org-agenda-work-file (concat org-agenda-dir "/Work.org"))
  (setq org-agenda-school-file (concat org-agenda-dir "/School.org"))
  (setq org-agenda-diary-file (concat org-agenda-dir "/Diary.org"))
  (setq org-capture-templates
	'(("p" "Project" entry (file+headline org-agenda-project-file "Project") "* %?\n%T")
	  ("d" "dailt" entry (file+function org-agenda-diary-file (lambda ()
								    (org-datetree-find-date-create
								     (org-date-to-gregorian (org-today)) t)))
	   "* %?\n%U" :empty-lines 1)
	  ("h" "Home" entry (file+headline org-agenda-home-file "Home") "* %?\n%T" :prepend t)
	  ("w" "Work" entry (file+headline org-agenda-work-file "Work") "* %?\n%T" :prepend t)
	  ("t" "Todo" entry (file+headline org-agenda-todo-file "Todo") "* %?\n%T" :prepend t)))

  :bind
  (("C-c a" . 'org-agenda)
   ("C-c c" . 'org-capture)))

(use-package org-download
  :config
  (setq-default org-download-image-dir "./images")
  (setq org-download-annotate-function 'ignore))
  
(use-package valign
  :hook (org-mode . valign-mode))

(use-package org-modern
  :after org
  :hook (
	 (org-mode . org-modern-mode)
	 (org-agenda-finalize . org-modern-agenda)))


(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n d" . org-roam-dailies-capture-today)
	 ("C-c n r" . org-roam-node-random))
  :custom
  (org-roam-directory (file-truename "~/org/note/roam/"))
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:25}" 'face 'org-tag)))
  (setq org-roam-database-connector 'sqlite-builtin)
  (setq org-roam-capture-templates
	'(("d" "default" plain
	   "%?"
	   :if-new (file+head "default/${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t)
	  ("u" "utils" plain
  	   "%?"
  	   :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils")
  	   :unnarrowed t)
	  ("s" "school" plain
  	   "%?"
  	   :if-new (file+head "school/${slug}.org" "#+title: ${title}\n#+filetags: school")
  	   :unnarrowed t)
	  ("l" "programming language" plain
	   "%?"
	   :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language")
	   :unnarrowed t)
	  ("p" "project" plain
	   "%?"
	   :if-new (file+head "project/${slug}.org" "#+title: ${title}\n#+filetags: project")
	   :unnarrowed t)
	  ("b" "book" plain
	   "%?"
	   :if-new (file+head "book/${slug}.org" "#+title: ${title}\n#+filetags: book")
	   :unnarrowed t)
	  ))
  :config
  (org-roam-db-autosync-mode))
  
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
     "/DONE" 'agenda))

(provide 'init-org)
