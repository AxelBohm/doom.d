;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! org-wild-notifier)
(package! evil-matchit)
(package! evil-tex :recipe (:host github :repo "iyefrat/evil-tex"))

(package! doom-quit :disable t)
(package! doom-snippets :disable t)
