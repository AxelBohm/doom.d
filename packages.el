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
(package! helm-bibtex :pin "12f8809aac3a13dd11a1c664a13f789005f7a199")
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
(unpin! org-roam)
;; When using bibtex-completion via the `biblio` module
(unpin! bibtex-completion helm-bibtex ivy-bibtex)

(package! doom-quit :disable t)
(package! doom-snippets :disable t)