;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! org-wild-notifier)
(package! evil-matchit)
(package! org-roam-bibtex)
(package! company-bibtex)
(package! helm-bibtex :pin "12f8809aac3a13dd11a1c664a13f789005f7a199")

(package! doom-quit :disable t)
(package! doom-snippets :disable t)
