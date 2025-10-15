;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! org-wild-notifier)
(package! evil-matchit)
(package! org-ref)
(package! company-bibtex)
(package! helm-bibtex)
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
(package! org-roam-ui)
(unpin! org-roam)
;; When using bibtex-completion via the `biblio` module
;; (unpin! bibtex-completion helm-bibtex ivy-bibtex)
(unpin! evil-tex)

(package! elfeed-score)

(package! gitconfig-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitconfig-mode.el")))
(package! gitignore-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitignore-mode.el")))

(package! doom-quit :disable t)
(package! doom-snippets :disable t)
(package! elfeed-goodies :disable t)
(disable-packages! ws-butler)

(package! gscholar-bibtex
  :recipe (:host github :repo "cute-jumper/gscholar-bibtex"))

;; inline latex
(package! org-fragtog)

;; LLM in emacs
(package! gptel :recipe (:nonrecursive t))