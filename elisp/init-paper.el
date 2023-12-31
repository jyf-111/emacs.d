(use-package papis
  :straight (:host github :repo "papis/papis.el" :files ("dist" "*.el"))
  :bind ("C-c n p" . papis-open))

(use-package org-noter
  :custom
  (org-noter-notes-search-path '("~/Documents/notes/"))
  :bind ("C-c n n" . org-noter))

(use-package ebib
  :config
  (setq ebib-preload-bib-files '("~/Documents/papers/index.bib"))
  (setq ebib-notes-directory "~/Documents/papers/notes/")
  (setq ebib-file-search-dirs '("~/Documents/papers/bibtex-pdfs/"))
  (setq ebib-file-associations '(("pdf" . "open")))
  (setq ebib-bibtex-dialect 'biblatex)
  (setq ebib-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n")
  (setq ebib-notes-template-one-file "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"))

(use-package org-ref
  :init (use-package ivy-bibtex)
  :custom
  (bibtex-completion-bibliography '("~/Documents/papers/index.bib")
	bibtex-completion-library-path '("~/Documents/papersaper/bibtex-pdfs/")
	bibtex-completion-notes-path "~/Documents/papersr/notes/"
	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

	bibtex-completion-additional-search-fields '(keywords)
	bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "open" nil 0 nil fpath)))
  )

(provide 'init-paper)
