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
(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")) :pin "9474a254390b1e42488a1801fed5826b32a8030b")
(package! websocket :pin "82b370602fa0158670b1c6c769f223159affce9b") ; dependency of `org-roam-ui'
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

(package! gscholar-bibtex
  :recipe (:host github :repo "cute-jumper/gscholar-bibtex"))