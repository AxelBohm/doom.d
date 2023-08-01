(setq doom-localleader-key ",")

(general-auto-unbind-keys)

(setq doom-theme 'doom-opera-light)

(remove-hook 'text-mode-hook #'hl-line-mode)

;;(setq doom-font (font-spec :family "Terminus" :size 14))
;; (setq doom-font (font-spec :family "FiraCode-Regular" :size 24)

(show-paren-mode 1)

;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type nil)

(setq-default truncate-lines nil)

;; (set-frame-parameter (selected-frame) 'alpha '(85 . 85))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 85)))

(after! doom-modeline
  ;; Disable unwanted modeline details.
  (size-indication-mode 0)

  ;; ;; Define a new default modeline.
  ;; (doom-modeline-def-modeline 'myline
  ;;   '(bar workspace-name window-number buffer-info remote-host)
  ;;   '(matches debug checker))

  ;; ;; Actually use the new settings.
  ;; (add-hook 'doom-modeline-mode-hook
  ;;   (lambda ()
  ;;     (doom-modeline-set-modeline 'myline 'default)))
  )

(add-hook 'after-init-hook 'global-hl-todo-mode)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(remove-hook 'text-mode-hook #'auto-fill-mode)

(setq scroll-margin 5)

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("/neomutt" . mail-mode))

(add-hook 'mail-mode-hook #'auto-fill-mode)
(add-hook 'mail-mode-hook
          (lambda ()
            (set-fill-column 72)))

;; Function to return first name of email recipient
;; Used by yasnippet

(setq show-week-agenda-p t)

(defun ab/visit-references ()
  "go to my references file"
  (interactive)
  (find-file "~/org/Reference.org"))

(map! "M-w" 'other-window)

(defun ivy-ffow-done ()
  "Exit the minibuffer, opening candidate in other window."
  (interactive)
  (ivy-set-action #'find-file-other-window)
  (ivy-done))

(map! :after counsel
      :map counsel-find-file-map
      "M-RET" #'ivy-ffow-done)

;; (run-at-time (current-time) 300 'recentf-save-list)

(defun ab/visit-emacs-config ()
  "go to emacs config file"
  (interactive)
  (find-file "~/.doom.d/config.org"))

(map! :leader "e c" #'ab/visit-emacs-config)

(defun ab/visit-init ()
  "go to doom init file"
  (interactive)
  (find-file "~/.doom.d/init.el"))

(map! :leader "e i" #'ab/visit-init)

(defun ab/reload-init-file ()
  "reload config file"
  (interactive)
  (load-file "~/.doom.d/config.el"))

(map! :leader "e r" 'ab/reload-init-file)

(setq evil-respect-visual-line-mode nil)

(map! :leader
      "q"   #'evil-quit
      "s h" #'evil-window-split
      "s v" #'evil-window-vsplit
      "e c" #'ab/visit-emacs-config
      "o r" #'ab/visit-references
      "x"   #'counsel-M-x ;; no need to press *meta*
      "w"   #'save-buffer)

(after! evil
  (define-key evil-visual-state-map "l" evil-inner-text-objects-map)
  (define-key evil-operator-state-map "l" evil-inner-text-objects-map)
  (map! :n "l" 'evil-insert
        :n "L" 'evil-insert-line
        :nv "h" 'evil-backward-char
        :nv "i" 'evil-forward-char
        :nv "n" 'evil-next-visual-line
        :nv "e" 'evil-previous-visual-line
        :nv "k" 'evil-ex-search-next
        :nv "K" 'evil-ex-search-previous
        :n "N" 'evil-join
        ;; :vo "l" evil-inner-text-objects-map
        :nvo "j" 'evil-forward-word-end
        :nvo "J" 'evil-forward-WORD-end))

(after! magit
  (map! :map magit-mode-map
        :n "n" 'magit-next-line
        :n "e" 'magit-previous-line))

(map! :map org-agenda-mode-map
      :m "n" 'org-agenda-next-line
      :m "e" 'org-agenda-previous-line
      )

;; (defgroup evil-colemak nil
;;   "Basic key rebindings for evil-mode with the Colemak keyboard layout."
;;   :prefix "evil-colemak-"
;;   :group 'evil)

;; (defcustom evil-colemak-char-jump-commands nil
;;   "The set of commands to use for jumping to characters.
;;         By default, the built-in evil commands evil-find-char (and
;;         variations) are used"
;;   :group 'evil-colemak
;;   :type '(choice (const :tag "default" nil)))

;; (defun evil-colemak--make-keymap ()
;;   "Initialise the keymap baset on the current configuration."
;;   (let ((keymap (make-sparse-keymap)))
;;     (evil-define-key '(motion normal visual) keymap
;;       "n" 'evil-next-visual-line
;;       ;; "gn" 'evil-next-visual-line
;;       ;; "gN" 'evil-next-visual-line
;;       "e" 'evil-previous-visual-line
;;       ;; "ge" 'evil-previous-visual-line
;;       "E" 'evil-lookup
;;       "i" 'evil-forward-char
;;       "I" 'evil-end-of-line
;;       "j" 'evil-forward-word-end
;;       "J" 'evil-forward-WORD-end
;;       "gj" 'evil-backward-word-end
;;       "gJ" 'evil-backward-WORD-end
;;       "k" 'evil-ex-search-next       ;; doom needs an "ex"
;;       "K" 'evil-ex-search-previous   ;; doom needs an "ex"
;;       "gk" 'evil-next-match
;;       "gK" 'evil-previous-match
;;       "zi" 'evil-scroll-column-right
;;       "zI" 'evil-scroll-right)
;;     (evil-define-key '(normal visual) keymap
;;       "N" 'evil-join
;;       "gN" 'evil-join-whitespace)
;;     (evil-define-key 'normal keymap
;;       "l" 'evil-insert
;;       "L" 'evil-insert-line)
;;     (evil-define-key 'visual keymap
;;       "L" 'evil-insert)
;;     (evil-define-key '(visual operator) keymap
;;       "l" evil-inner-text-objects-map)
;;     (evil-define-key 'operator keymap
;;       "i" 'evil-forward-char)
;;     keymap))

;; (defvar evil-colemak-keymap
;;   (evil-colemak--make-keymap)
;;   "Keymap for evil-colemak-mode.")

;; (defun evil-colemak-refresh-keymap ()
;;   "Refresh the keymap using the current configuration."
;;   (setq evil-colemak-keymap (evil-colemak--make-keymap)))

;;       ;;;###autoload
;; (define-minor-mode evil-colemak-mode
;;   "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
;;   :keymap evil-colemak-keymap
;;   :lighter " hnei")

;;       ;;;###autoload
;; (define-globalized-minor-mode global-evil-colemak-mode
;;   evil-colemak-mode
;;   (lambda () (evil-colemak-mode t))
;;   "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")

;; (after! evil
;;   (global-evil-colemak-mode))

(with-eval-after-load 'evil-maps
  (define-key evil-window-map "n" 'evil-window-down)
  (define-key evil-window-map "e" 'evil-window-up)
  (define-key evil-window-map "i" 'evil-window-right))

(after! evil
  (map! :map evil-org-mode-map
        :mnvo "i" #'evil-forward-char
        :mnvo "I" #'evil-end-of-line))

(after! evil-org
  (map! :map evil-org-mode-map
        :mnvo "i" #'evil-forward-char
        :mnvo "I" #'evil-org-end-of-line))

;; (after! evil
;;   (map! :map evil-tex-mode-map
;;         :mnvo "i" #'evil-forward-char
;;         :mnvo "I" #'evil-org-end-of-line))
;; (add-hook 'evil-tex-mode-hook (lambda () (global-evil-colemak-mode)))
;; (add-hook 'LaTeX-mode-hook (lambda () (global-evil-colemak-mode)))

;; (evil-collection-translate-key nil 'evil-motion-state-map
;;   ;; colemak hnei is qwerty hjkl
;;   "n" "j"
;;   "e" "k"
;;   "i" "l"
;;   ;; add back nei
;;   "j" "e"
;;   "k" "n"
;;   "l" "i")
;; (defun my-hjkl-rotation (_mode mode-keymaps &rest _rest)
;;   (evil-collection-translate-key 'normal mode-keymaps
;;     "n" "j"
;;     "e" "k"
;;     "i" "l"
;;     "j" "e"
;;     "k" "n"
;;     "l" "i"))

;; ;; called after evil-collection makes its keybindings
;; (add-hook 'evil-collection-setup-hook #'my-hjkl-rotation)

;; (evil-collection-init)

(after! evil
  (global-evil-matchit-mode))

(with-eval-after-load 'evil
  (defadvice forward-evil-paragraph (around default-values activate)
    (let ((paragraph-start (default-value 'paragraph-start))
          (paragraph-separate (default-value 'paragraph-separate)))
      ad-do-it)))

(after! evil
  (map! :mnv "H" #'evil-first-non-blank
        :mnv "I" #'evil-end-of-line
        :mnv "E" #'+lookup/definition
        :leader "l" 'avy-goto-line))

(after! evil-org
  (map! :mnv "H" #'evil-first-non-blank
        :mnv "I" #'evil-end-of-line
        :mnv "E" #'+lookup/definition
        :leader "l" 'avy-goto-line))

(after! evil-snipe
  (map! :leader "/" #'evil-avy-goto-char-2))

(defun ab/switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(map! :leader "SPC" #'ab/switch-to-previous-buffer)

(setq org-fold-core-style 'overlays)

(after! org
  (setq +org-roam-auto-backlinks-buffer t
        org-hide-emphasis-markers nil            ;; I want those
        org-return-follows-link t
        ;; the follow two do not work for some reason and others seem to have the same problem
        org-agenda-skip-scheduled-if-done t      ;; don't show in agenda if done
        org-agenda-skip-deadline-if-done  t
        ;;
        org-agenda-compact-blocks t
        org-reverse-note-order t                 ;; add new headings on top
        org-tags-column 0                        ;; position of tags (0 is to the left)
        org-log-done 'time                       ;; add time when task was completed
        org-todo-keywords '((sequence "TODO(t)"
                                      "NEXT(n)"
                                      "WAITING(w)"
                                      "|"
                                      "DONE(d)")
                            ;; research specific
                            (sequence "TODO(t)"
                                      "DIDN'T SUCCEED(s)"
                                      "|"
                                      "DOESN'T WORK(x)"
                                      "TOO HARD(h)"
                                      "DONE(d)"))

        org-todo-keyword-faces '(("WAITING" :foreground "#8FBCBB" :weight bold)
                                 ("NEXT" :foreground "#ff9800" :weight bold)
                                 )))

(map! :leader
      "o s l" 'org-store-link
      "o s n" 'default/org-notes-search
      ;; "o a" 'org-agenda
      "o c" 'org-capture)

(defun ab/disable-line-numbers ()
  (interactive)
  (display-line-numbers-mode -1))

(add-hook 'org-mode-hook #'ab/disable-line-numbers)

(after! org
  (setq-hook! 'org-mode-hook +flyspell-immediately nil))

(setq org-agenda-show-future-repeats 'next)

(setq org-agenda-format-date
          (lambda (date)
            (concat "  " (org-agenda-format-date-aligned date))))

(setq org-agenda-custom-commands
      '(("W" "Weekly Review"
         ((agenda "" ((org-agenda-span 14))); review upcoming deadlines and appointments
                                           ; type "l" in the agenda to review logged items
          (todo "PROJECT") ; review all projects (assuming you use todo keywords to designate projects)
          (todo "MAYBE") ; review someday/maybe items
          (todo "WAITING"))) ; review waiting items

         ;; ...other commands here
        ("n" todo "NEXT")

        ("g" "Get Things Done (GTD)"
         ((todo "LALA" ;; dummy item just so I can get a header for the deadlines (see next item)
                ((org-agenda-overriding-header "\nScheduled\n")))
          (agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline 'done))   ;; deadlines go in a different "section"
                   (org-agenda-show-all-dates nil)
                   (org-agenda-prefix-format "    [%e]  ")
                   (org-agenda-overriding-header "\nScheduled\n")  ;; not working
                   (org-deadline-warning-days 0)))
          ;; (todo "LALA"
          ;;       ((org-agenda-overriding-header "\nUpcoming\n")))
          ;; (agenda ""
          ;;         (
          ;;          ;; (org-agenda-span 1)
          ;;          (org-agenda-skip-function
          ;;           '(org-agenda-skip-entry-if 'deadline))
          ;;          (org-agenda-show-all-dates nil)
          ;;          (org-agenda-overriding-header "\nScheduled\n")  ;; not working
          ;;          (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %i %-12:c [%e] %s ")
                 (org-agenda-overriding-header "\nNext Action\n")))

          (todo "LALA" ;; dummy item just so I can get a header for the deadlines (see next item)
                ((org-agenda-overriding-header "\nDeadlines\n")))
          (agenda ""
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-show-all-dates nil)
                   (org-agenda-prefix-format " %i [%e] %s ")
                   (org-agenda-overriding-header "\nDeadlines\n")  ;; not working
                   (org-deadline-warning-days 0)))
          (tags "inbox"
                     ((org-agenda-prefix-format "  [%e]  ")
                      (org-agenda-overriding-header "\nInbox\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))

        ))

(map! :leader "o g" (lambda ()
             (interactive)
             (org-agenda nil "g")))

(after! org
  (custom-theme-set-faces
   'user
   `(org-document-title ((t (:height 1.5 :underline nil))))))

(after! org
  (setq org-ellipsis " ..."))

(after! org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))
  (add-hook 'org-mode-hook 'org-fragtog-mode)
  )

(after! org
  (setq org-directory "~/org")

  (defun org-file-path (filename)
    "Return the absolute address of an org file, given its relative name."
    (concat (file-name-as-directory org-directory) filename))

  (setq org-inbox-file "~/org/inbox.org")
  (setq org-index-file (org-file-path "index.org"))
  ;; (setq org-inbox-file "~/Dropbox/GTD/inbox.org")
  (setq org-archive-location
        (concat (org-file-path "archive.org") "::* From %s")))

(after! org
  (setq org-agenda-files (list org-index-file
                               org-inbox-file
                               (org-file-path "archive.org") ;; I want to see also completed items
                               (org-file-path "Reference.org"))))

(after! org (setq org-startup-truncated 'nil))

(after! org
  (setq org-agenda-span 14)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-day "-0d"))

(after! org
  (map! :map org-mode-map
        :localleader
        "w" 'widen                   ;; show everythig
        "n" 'org-toggle-narrow-to-subtree)  ;; show only what's within heading
)

(defun ab/org-show-just-me (&rest _)
  "Fold all other trees, then show entire current subtree."
  (interactive)
  (org-overview)
  (org-reveal)
  (org-show-subtree))

(map! :map org-mode-map
      :localleader "N" 'ab/org-show-just-me)            ;; Mnemonic: narrow

(map! :map org-mode-map
      "M-e" #'org-metaup
      "M-i" #'org-metaright
      "M-n" #'org-metadown)

(after! org
  (map! :map org-mode-map
        "M-o" '+org/insert-item-below
        "M-O" '+org/insert-item-above))

;; (defun ab/copy-tasks-from-mobile
;;   "Copy tasks I added from Orgzly"
;;   (interactive)
;;   (when (file-exists-p org-inbox-file)
;;     (save-excursion
;;       (find-file org-inbox-file)
;;       (org-refile org-index-file)))
;;     )

(defun ab/open-index-file ()
  "Open the master org TODO list."
  (interactive)
  ;; (find-file org-inbox-file)
  ;; (split-window-horizontally)
  (find-file org-index-file)
  )

(map! :leader "i" #'ab/open-index-file)
(map! :leader "o i" #'ab/open-index-file)

(defvar mybibfile "~/academia/bibliography/bibfile.bib" "some comment")

(defun ab/open-bibfile ()
  "Open the master org TODO list."
  (interactive)
  (find-file "~/academia/bibliography/bibfile.bib"))


(map! :leader "o b" #'ab/open-bibfile)
(map! :leader "b f" #'ab/open-bibfile)

(map! :map org-mode-map
        :localleader
        "g h" 'org-previous-visible-heading      ;; Go Heading of current section
        "g e" 'org-previous-visible-heading      ;; Go e (= colemak up)
        "g u" 'outline-up-heading                ;; Go Up in hierarchy
        "g n" 'org-next-visible-heading          ;; Go Next heading
        )

(map! :map org-mode-map
   :n "]" 'org-next-visible-heading
   :n "[" 'org-previous-visible-heading)

(defun ab/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(map! :map org-mode-map :leader "o d" 'ab/mark-done-and-archive)

(defun ab/insert-url-as-org-link-fancy ()
  "If there's a URL on the clipboard, insert it as an org-mode
link in the form of [[url][*]], and leave point at *."
  (interactive)
  (let ((link (substring-no-properties (x-get-selection 'CLIPBOARD)))
        (url  "\\(http[s]?://\\|www\\.\\)"))
    (save-match-data
      (if (string-match url link)
          (progn
            (insert (concat "[[" link "][]]"))
            (backward-char 2)
            (evil-insert)
            )

        (error "No URL on the clipboard")))))

(map! :map org-mode-map :localleader "l u" 'ab/insert-url-as-org-link-fancy)

(defun ab/open-agenda-next-tasks  ()
  "show all tasks marked as NEXT"
  (interactive)
  (org-tags-view t "/NEXT"))

(map! :leader "o n" 'ab/open-agenda-next-tasks)

(after! org
  (add-hook 'org-capture-mode-hook 'evil-insert-state))

(after! org
 (setq org-refile-targets '((nil :maxlevel . 6)
                            (org-agenda-files :maxlevel . 6))))
;; (setq org-completion-use-ido t)

;; (setq org-outline-path-complete-in-steps nil) ;; has to be nil for ido to work
;; (setq org-refile-use-outline-path 'file)

(after! org
  (setq org-capture-templates
        '(("l" "Link (with todo)" entry
           ;; (file+headline org-index-file "Inbox")
           (file org-inbox-file)
           "*** TODO %^{task}
:properties:
:context: %A
:file: %F
:end:
%?\n")

          ("n" "Note"  entry
           ;; (file+headline org-index-file "Inbox")
           (file org-inbox-file)
           "*** %?\n\n")

          ;; no need for a separate `org-roam-capture` function or key-combo
          ("r" "org-roam" entry
           (function org-roam-capture))

          ("t" "Todo" entry
           ;; (file+headline org-index-file "Inbox")
           (file org-inbox-file)
           "*** TODO %?
:properties:
:created: %U
:end:"))))

(after! org (add-to-list 'org-capture-templates
          '("s" "Scheduled task"  entry
           ;; (file+headline org-index-file "Inbox")
           (file org-inbox-file)
           "*** TODO %^{task}
SCHEDULED: %^t
:properties:
:created: %U
:WILD_NOTIFIER_NOTIFY_BEFORE: %^{notify when?} 30 5
:end:
%?\n
")))

(after! org
  (defadvice org-switch-to-buffer-other-window
      (after supress-window-splitting activate)
    "Delete the extra window if we're in a capture frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (delete-other-windows)))

  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (delete-frame)))

  (defun activate-capture-frame ()
    "run org-capture in capture frame"
    (select-frame-by-name "capture")
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (org-capture)))

;; (load "server")
;; (unless (server-running-p) (server-start))

(after! org
  (advice-add 'counsel-org-capture :override #'org-capture))

(after! org
  :init
  (add-hook 'org-mode-hook #'org-wild-notifier-mode t)
  :config
  (setq org-wild-notifier-alert-time 15
        ;; use dunst for system wide notifications
        alert-default-style 'libnotify))

(after! org
  (add-hook 'org-mode-hook
            '(lambda ()
               (delete '("\\.pdf\\'" . default) org-file-apps)
               (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s")))))

(setq org-noter-always-create-frame nil)
(setq org-noter-notes-search-path org-roam-directory)

(setq org-roam-directory "~/org/roam")

(setq org-roam-db-location "~/.cache/oarg-roam.db")

(defun ab/org-roam-rg-search()
 "Do counsel-rg on the org roam directory"
 (interactive)
 (counsel-rg nil org-roam-directory))

(global-set-key (kbd "C-c rr") 'ab/org-roam-rg-search)
(map! :leader "r r" #'ab/org-roam-rg-search)
(map! :leader "n d" #'ab/org-roam-rg-search)

(setq org-roam-capture-templates
      '(
        ("b" "bibliography reference" plain "%?"
         :target
         (file+head "${citekey}.org"
                    ":properties:
:author: ${author-or-editor}
:#+created: %(org-insert-time-stamp (current-time) t t)
:#+last_modified: %(org-insert-time-stamp (current-time) t t)
:end:
#+title: ${title}\n#+citations:\n\n\n* abstract\n\n* drawback\n\n* quotes\n\n* discovered\n\n
")
         :unnarrowed t)

        ("y" "youtube video" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    ":properties:
:author:
:#+created: %(org-insert-time-stamp (current-time) t t)
:#+last_modified: %(org-insert-time-stamp (current-time) t t)
:#+link:
:end:
#+title: youtube: ${title}\n
")
         :unnarrowed t)

        ("p" "podcast" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    ":properties:
:author:
:#+created: %(org-insert-time-stamp (current-time) t t)
:#+last_modified: %(org-insert-time-stamp (current-time) t t)
:#+link:
:end:
#+title: podcast: ${title}\n
")
         :unnarrowed t)

        ("r" "reading (book notes)" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    ":properties:
:author:
:year:
:#+created: %(org-insert-time-stamp (current-time) t t)
:#+last_modified: %(org-insert-time-stamp (current-time) t t)
:end:
#+title: Book: ${title}\n
")
         :unnarrowed t)

        ("d" "default" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    ":properties:
:#+created: %(org-insert-time-stamp (current-time) t t)
:#+last_modified: %(org-insert-time-stamp (current-time) t t)
:end:
#+title: ${title}
")
         :unnarrowed t)))

(after! org
  (setq time-stamp-active t
        time-stamp-line-limit 10
        time-stamp-start "#\\+last_modified: [\t]*"
        time-stamp-end "$"
        time-stamp-format "\[%Y-%02m-%02d %02H:%02M\]"
        )
  (add-hook 'write-file-hooks 'time-stamp)
  )

(use-package! org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref)) ; optional: if Org Ref is not loaded anywhere else, load it here

(after! org-roam
  (org-roam-bibtex-mode))

(setq orb-preformat-keywords
      '("citekey" "title" "url" "author-or-editor" "keywords" "file")
      orb-process-file-keyword t
      orb-file-field-extensions '("pdf"))

;; (setq orb-templates
;;       '(("r" "ref" plain "%?"
;;          :target
;;          (file+head "${citekey}.org" "#+title: ${title}\n"))))
;; #+roam_key: ${ref}
;; #+author: ${author-or-editor}
;; #+created: %(org-insert-time-stamp (current-time) t t)
;; #+last_modified: %(org-insert-time-stamp (current-time) t t)

;; - tags ::
;; - keywords :: ${keywords}

;; \n* ${title}
;; :properties:
;; :citekey: ${citekey}
;; :author: ${author-or-editor}
;; :noter_document: ${file}
;; :end:"))))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  ;; :commands org-roam-ui-open
  ;; :hook (org-roam . org-roam-ui-mode)
  :config
  (require 'org-roam) ; in case autoloaded
  (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t)
  )

;; (after! magit
;; (add-to-list 'magit-section-initial-visibility-alist (cons 'org-roam-node-section 'hide)))

(defun my/preview-fetcher ()
  (let* ((elem (org-element-context))
         (parent (org-element-property :parent elem)))
    ;; TODO: alt handling for non-paragraph elements
    (string-trim-right (buffer-substring-no-properties
                        (org-element-property :begin parent)
                        (org-element-property :end parent)))))

(setq org-roam-preview-function #'my/preview-fetcher)

(map! :leader "o t" nil)

(map! :leader
      :desc "open terminal here" "o t h" #'+vterm/toggle
      :desc "set timer" "o t s" #'org-timer-set-timer
      :desc "pause or continue" "o t p" #'org-timer-pause-or-continue)

(use-package! gscholar-bibtex
  :config
  (gscholar-bibtex-source-on-off :off "IEEE Xplore")
  (setq gscholar-bibtex-default-source "Google Scholar")
  (setq gscholar-bibtex-database-file "~/academia/bibliography/bibfile.bib"))

;; originally: buffer-save
(map! :leader "b s" nil)
;; originally: switch-buffer
(map! :leader "b b" nil)

(map! :leader
      :desc "bibtex entry from arxiv" "b a" #'org-ref-bibtex-new-entry/arxiv-add-bibtex-entry-and-exit
      :desc "bibtex entry from biblio" "b b" #'org-ref-bibtex-new-entry/biblio-lookup-and-exit
      :desc "bibtex from google scholar" "b s" #'gscholar-bibtex)

;; (map! :leader "b a" 'arxiv-lookup)

(defvar arxiv-entry-format-string "@article{%s,
  title={%s},
  author={%s},
  year={%s},
  journal={arXiv preprint arXiv:%s},
  abstract={%s},
  url={%s},
}"
  "Template for BibTeX entries of arXiv articles.")

(defun arxiv-get-bibtex-entry-via-arxiv-api (arxiv-number)
  "Retrieve meta data for ARXIV-NUMBER.
Returns a formatted BibTeX entry."
  (with-current-buffer
      (url-retrieve-synchronously (format "http://export.arxiv.org/api/query?id_list=%s" arxiv-number) t)
    (let* ((parse-tree (libxml-parse-xml-region
                        (progn (goto-char 0)
                               (search-forward "<?xml ")
                               (match-beginning 0))
                        (point-max)))
           (entry (assq 'entry parse-tree))
           (authors (--map (nth 2 (nth 2 it))
                           (--filter (and (listp it) (eq (car it) 'author)) entry)))
           (year (format-time-string "%Y" (date-to-time (nth 2 (assq 'published entry)))))
           (title (nth 2 (assq 'title entry)))
           (names (arxiv-bibtexify-authors authors))
           (category (cdar (nth 1 (assq 'primary_category entry))))
           (abstract (s-trim (nth 2 (assq 'summary entry))))
           (url (nth 2 (assq 'id entry)))
           (temp-bibtex (format arxiv-entry-format-string "" title names year arxiv-number abstract url))
           (key (with-temp-buffer
                  (insert temp-bibtex)
		  (bibtex-mode)
		  (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
		  (org-ref-replace-nonascii)
                  (bibtex-generate-autokey)))
	   (doi (assq 'doi entry)))
      (if doi
	  (doi-utils-doi-to-bibtex-string (nth 2 doi))
	;; no doi, so we fall back to the simple template
	(format arxiv-entry-format-string key title names year arxiv-number abstract url)))))

(after! org
  (setq org-journal-date-prefix "#+title: "
        org-journal-time-prefix "* "
        org-journal-date-format "%A, %Y-%m-%d"
        org-journal-file-format "%Y-%m-%d.org"
  ))

(after! latex
  (setq tex-fontify-script t
        ;; automatically put braces after ^ and _
        TeX-electric-sub-and-superscript nil
        ;; stop asking if I want to save
        TeX-save-query nil
        ;; auto insert second dollar sign
        ;; TeX-electric-math (cons "$" "$")
        ;; don't show ^ or _ for scripts
        font-latex-fontify-script t)

  ;; use Zathura as pdf viewer
  (setq TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-source-correlate-start-server t))

;; Ensure that synctex works and the pdf is updated.
(after! latex
  (add-hook! 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

(after! tex
  (setq-hook! 'TeX-mode-hook +flyspell-immediately nil))

(defun ab/run-latexmk ()
  "Run LatexMk without asking for confirmation. Saves the master file (and children)."
  (interactive)
  (TeX-save-document (TeX-master-file))
  (TeX-command "LatexMk" #'TeX-master-file -1))

(map! :map LaTeX-mode-map
      :localleader
      :desc "Compile"     ","  #'TeX-command-run-all
      :desc "Fold"        "z"  #'TeX-fold-buffer
      :desc "ToC"         "t"  #'reftex-toc
      :desc "next err"    "n"  #'TeX-next-error
      :desc "View"        "v"  #'TeX-view
      :desc "count words" "c"  #'tex-count-words
)

(add-to-list 'company-backends 'company-bibtex)
(setq company-bibtex-bibliography
  '("~/academia/bibliography/bibfile.bib"))

(eval-after-load 'evil-matchit-latex
  '(progn
     (push '("langle" nil "rangle") evilmi-latex-match-tags)))
     ;; (push '(("unless" "if") ("elsif" "else") "end"))) evilmi-latex-match-tags)

(add-hook 'TeX-mode-hook (lambda () (interactive) (evil-tex-mode 1)))

(map! :map LaTeX-mode-map
      :localleader :desc "toggle delimiter" "d"  #'evil-tex-toggle-delim)

(after! evil-tex
  ;; `ts` starts Toggle Surround
  (setq evil-tex-toggle-override-t t))

;; (after! latex
;;     (add-to-list TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)))

(map! :leader "b t" 'ivy-bibtex)

(after! bibtex-completion

  (setq! bibtex-completion-bibliography '("~/academia/bibliography/bibfile.bib")
         bibtex-completion-notes-path org-roam-directory
         bibtex-completion-library-path '("~/ucloud/my_stuff/papers/" )))

(after! bibtex-completion
  (setq! bibtex-completion-find-additional-pdfs t))

(setq! +biblio-pdf-library-dir "~/ucloud/my_stuff/papers/"
       +biblio-default-bibliography-files "~/academia/bibliography/bibfile.bib"
       +biblio-notes-path org-roam-directory)

(after! bibtex-completion
  (setq bibtex-completion-additional-search-fields '(tags)))

(after! ivy-bibtex

  (setq ivy-height 30) ;; this is actually a general ivy configuration

  (defun bibtex-completion-pdf-open-with-zathura (entry)
    (let ((pdf (bibtex-completion-find-pdf entry)))
      (call-process "zathura" nil 0 nil (car pdf)))
      (kill-buffer "*doom*"))

  (defun bibtex-completion-pdf-open-with-evince (entry)
    (let ((pdf (bibtex-completion-find-pdf entry)))
      (call-process "evince" nil 0 nil (car pdf)))
      (+workspace/close-window-or-workspace)
      ;; (kill-buffer "*doom*")
      )

  ;; (ivy-add-actions 'ivy-bibtex '(("o" ivy-bibtex-open-any "Open PDF, URL, or DOI")))

  ;; (setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)

;; the default action list is too long and there is no (obvious) way to remove entries so I start from scratch
(ivy-set-actions
 'ivy-bibtex
 '(("o" ivy-bibtex-open-any "Open PDF, URL, or DOI")
   ("i" ivy-bibtex-insert-key "Insert key")
   ;; ("a" ivy-bibtex-add-PDF-attachment "Attach PDF to email") ;; email not yet working
   ("s" ivy-bibtex-show-entry "Show entry")
   ("z" bibtex-completion-pdf-open-with-zathura "Open PDF in zathura")
   ("E" bibtex-completion-pdf-open-with-evince "Open PDF in Evince")
   ;; ("c" ivy-bibtex-insert-link-to-file "Insert link to file") ;; this could make org-ref obsolete
   ("e" ivy-bibtex-edit-notes "Edit notes"))))

;; (helm-add-action-to-source "Open PDF with zathura" 'bibtex-completion-pdf-open-with-zathura helm-source-bibtex 1)

(after! org-ref
  (map! :localleader "i" nil)
  (map! :map org-mode-map
        :localleader
        :desc "insert citation" "i" #'org-ref-cite-insert-helm))
(after! org
  (map! :localleader "i" nil)
  (map! :map org-mode-map
        :localleader
        :desc "insert citation" "i" #'org-ref-cite-insert-helm))

(setq reftex-default-bibliography '("~/academia/bibliography/bibfile.bib"))

(after! yasnippet
  (setq yas-snippet-dirs '("~/.doom.d/snippets")
        yas-triggers-in-field t)
  ;; remove random additional newline at the end of new snippets
  (setq-default mode-require-final-newline nil)
  (map! :map yas-minor-mode-map
        :i "C-e" 'yas-expand
        :i "C-f" 'yas-next-field) ;; sometimes I don't want to expand and just go to the next field
  (map! :map yas-keymap "C-e" 'yas-next-field-or-maybe-expand))

(after! yasnippet
  (map! :leader "s n" 'yas/new-snippet              ;; Snippet New
        ;; :leader "s f" '+snippet/find                ;; Snippet Go
        :leader "s g" 'yas-visit-snippet-file))      ;; Snippet Go

(defun ab/yas-try-expanding-auto-snippets ()
  (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
    (yas-expand)))
(add-hook 'post-command-hook #'ab/yas-try-expanding-auto-snippets)

(after! warnings
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change)))

(after! flycheck
;;(flycheck-display-errors-delay .3)
;;(setq-default flycheck-disabled-checkers '(tex-chktex)))
  (map! :leader "a" 'flycheck-next-error))

(after! python
  (map! :map python-mode-map
        :localleader "r r" 'run-python
                     "s s" 'python-shell-switch-to-shell
                     "s r" 'python-shell-send-region
                     "r s" 'pyvenv-restart-python
                     ","   'python-shell-send-buffer     ; replace C-c C-c
                     "c a" 'conda-env-activate
        ))

(setq conda-anaconda-home (expand-file-name "~/.miniconda3"))
(setq conda-env-home-directory (expand-file-name "~/.miniconda3"))

(defun python-shell-start-and-send-buffer()
  (interactive)
  (run-python)
  (evil-window-left)
  (python-shell-send-buffer))

(defun ab/restart-and-run-python()
  "restart and run to make sure all changes are registered when running code"

  (interactive)
  ;; (pyvenv-restart-python)
  (kill-process "Python")
  (sleep-for 0.05)
  (kill-buffer "*Python*")
  (previous-window-any-frame)
  (run-python))

(after! python
  (setq python-shell-completion-native-enable nil))

(after! conda
  (conda-env-initialize-eshell)
  (conda-env-autoactivate-mode))

;; (defun my-flycheck-setup ()
;;   (flycheck-add-next-checker 'lsp 'python-flake8))

;; ;; These MODE-local-vars-hook hooks are a Doom thing. They're executed after
;; ;; MODE-hook, on hack-local-variables-hook. Although `lsp!` is attached to
;; ;; python-mode-local-vars-hook, it should occur earlier than my-flycheck-setup
;; ;; this way:
;; (add-hook 'python-mode-local-vars-hook #'my-flycheck-setup)

(setq default-input-method "TeX")

(map! :map julia-mode-map
    :localleader "r r"  'julia-repl
                 ","    'julia-repl-send-buffer
                 "l"    'julia-repl-send-line
                 "r l"  'julia-repl-send-line
    )

(after! julia-repl
  (julia-repl-set-terminal-backend 'vterm))

(define-minor-mode julia-repl-interaction-mode
  "Toggle keybinds to send lines to the julia-repl"
  :keymap (let ((map (make-sparse-keymap)))
          (define-key map (kbd "C-s") #'julia-repl-send-region-or-line)
          map))

(after! julia-mode
  (add-hook 'julia-mode-hook #'rainbow-delimiters-mode-enable)
  (add-hook! 'julia-mode-hook
    (setq-local lsp-enable-folding t
                lsp-folding-range-limit 100)))

(after! company
  :init
  (setq company-dabbrev-ignore-case nil
        company-idle-delay 0.2
        ;; Number the candidates (use M-1, M-2 etc to select completions).
        company-show-quick-access t
        company-tooltip-limit 7
        company-tooltip-minimum-width 40
        company-minimum-prefix-length 2) ;; 1 makes everything very laggy
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;; Add yasnippet support for all company backends
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

  (map! :i "C-n" 'company-complete)) ;; doesn't work

(map! (:when (featurep! :completion company)
        :i "C-n"      #'+company/complete
        :i "C-SPC"    #'+company/complete))

;; (set-company-backend! '(c-mode
;;                         ess-mode
;;                         emacs-lisp-mode
;;                         elisp-mode
;;                         latex-mode
;;                         tex-mode
;;                         lisp-mode
;;                         sh-mode
;;                         python-mode
;;                         )
;;   '(:separate  company-tabnine
;;                company-files
;;                company-capf
;;                company-yasnippet))

;; (setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))

(after! lsp
  (setq lsp-ui-mode t))

(after! flyspell
  :config
  (map! :leader "s c" 'flyspell-mode)      ;; toggle spell checking
  (map! :n "z=" 'ispell-word)

  (setq ispell-program-name "hunspell"
        ispell-silently-savep t            ;; save persal dictionary without asking
        ;; ispell-hunspell-dict-paths-alist '(("en_US" "~/.hunspell_en_US")
        ;;                                    ("de_AT" "~/.hunspell_de_AT"))
        ;; ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
        ;; ispell-list-command "--list"
        )
  (add-to-list 'ispell-local-dictionary-alist '(("en_US")))
  (add-to-list 'ispell-local-dictionary-alist '(("de_AT")))

  (add-to-list 'ispell-local-dictionary-alist '(("english-hunspell"
                                                 "[[:alpha:]]"
                                                 "[^[:alpha:]]"
                                                 "['‘’]"
                                                 t ; Many other characters
                                                 ("-d" "en_US")
                                                 nil
                                                 utf-8)))
  (add-to-list 'ispell-local-dictionary-alist '("deutsch-hunspell"
                                                "[[:alpha:]]"
                                                "[^[:alpha:]]"
                                                "[']"
                                                t
                                                ("-d" "de_AT"); Dictionary file name
                                                nil
                                                iso-8859-1))

)

(defun ab/save-word ()
  (interactive)
  (let ((current-location (point))
        (word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

(map! :n "z g" 'ab/save-word)

(after! ivy
  (map! "C-s" 'counsel-grep-or-swiper)
  ;; Virtual buffers correspond to bookmarks and recent files list
  (setq ivy-use-virtual-buffers t))

(after! smartparens
  (sp-local-pair 'org-mode "$" "$")
  ;; (sp-local-pair 'latex-mode "$" "$")   ;; omg, I want this so badly
  (sp-local-pair 'latex-mode "\\langle" "\\rangle" :trigger "\\lan")
  (sp-local-pair 'latex-mode "\\lVert" "\\rVert" :trigger "\\lVe")

  (sp-local-pair 'latex-mode "\\left(" "\\right)" :trigger "\\(")
  (sp-local-pair 'latex-mode "\\left[" "\\right]" :trigger "\\l[")
  (sp-local-pair 'latex-mode "\\left\\{" "\\right\\}" :trigger "\\l{")
  (sp-local-pair 'latex-mode "\\left\\langle" "\\right\\rangle" :trigger "\\left\\la")

  (smartparens-global-mode 1)) ;; I always want this

(after! mu4e
  (setq +mu4e-backend 'offlineimap)
  (setq mu4e-root-maildir "~/.mail"))

(defun mu4e-in-new-frame ()
  "Start mu4e in new frame."
  (interactive)
  (select-frame (make-frame))
  (mu4e))

(after! mu4e
  ;; Each path is relative to `+mu4e-mu4e-mail-path', which is ~/.mail by default
  (set-email-account! "uniwien"
                      '((user-full-name         . "Axel Böhm")
                        (user-mail-address      . "axel.boehm@univie.ac.at")
                        (smtpmail-smtp-user     . "boehma53")

                        (mu4e-sent-folder       . "/uniwien/INBOX.Sent/")
                        (mu4e-drafts-folder     . "/uniwien/INBOX.Drafts")
                        (mu4e-trash-folder      . "/uniwien/INBOX.Trash")
                        (mu4e-refile-folder     . "/uniwien/INBOX.Archive")
                        (smtpmail-smtp-server   . "mail.unvie.ac.at")
                        (smtpmail-default-smtp-server . "smtp.gmail.com")
                        (smtpmail-smtp-service  .  587)
                        (smtpmail-local-domain  . "univie.ac.at")
                        (mu4e-compose-signature . "---\nAxel Boehm"))
                      t)

  ;; use mu4e for e-mail in emacs
  (setq mail-user-agent 'mu4e-user-agent)
  ;; (Setq mu4e-sent-messages-behavior 'delete)

  ;; allow for updating mail using 'U' in the main view:
  ;; (setq mu4e-get-mail-command "offlineimap") )
  )

(after! mu4e
  (set-email-account! "ymail"
    `((mu4e-sent-folder       . "/ymail/Sent")
      (mu4e-drafts-folder     . "/ymail/Drafts")
      (mu4e-trash-folder      . "/ymail/Trash")
      (mu4e-refile-folder     . "/ymail/Archive")
      ;; (smtpmail-smtp-user     . ,(auth-source-pass-get "user" "mail/mainmail"))
      ;; (user-mail-address      . ,(auth-source-pass-get "user" "mail/mainmail"))
      (mu4e-compose-signature . "---\nAxel Boehm"))))

;; ( org-contacts
;;   :after org
;;   :custom (org-contacts-files '("~/documents/contacts.org")))

;; (setq mu4e-org-contacts-file (car org-contacts-files))
;; (add-to-list 'mu4e-headers-actions
;;              '("org-contact-add" . mu4e-action-add-org-contact) t)
;; (add-to-list 'mu4e-view-actions
;;              '("org-contact-add" . mu4e-action-add-org-contact) t)

(map! :map dired-mode
      "h" 'dired-up-directory)

(after! pdf-tools

  ;; more fine-grained zooming
  (setq! pdf-view-resize-factor 1.1)

  ;; (map! image-mode-map
  ;;  :m "i"   'image-forward-hscroll)

  (map!
   :map pdf-view-mode-map
   :m "n"   'evil-collection-pdf-view-next-line-or-next-page
   :m "e"   'evil-collection-pdf-view-previous-line-or-previous-page
   :m "i"   'image-forward-hscroll
   ;; :m "gg"  'pdf-view-first-page
   ;; :m "G"   'pdf-view-last-page
   ;; :m "h"   'pdf-view-con
   :m "C-o" 'pdf-view-shrink
   :m "C-i" 'pdf-view-enlarge
   :m "C-u" 'pdf-view-scroll-down-or-previous-page
   :m "C-d" 'pdf-view-scroll-up-or-next-page))

(after! pdf-tools
  (add-hook! 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode))

(setq pdf-annot-activate-created-annotations t)

(after! pdf-tools
  (map! :map pdf-view-mode-map
    :m "h" 'pdf-annot-add-highlight-markup-annotation)

  ;; automatically annotate highlights
  ;; (setq pdf-annot-activate-created-annotations t)
  )

(map! :leader "e f" #'elfeed)

(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(setq! elfeed-feeds
      '(("http://export.arxiv.org/api/query?search_query=cat:math.OC&start=0&max_results=300&sortBy=submittedDate&sortOrder=descending" research)
        ("http://www.argmin.net/feed.xml" blog)))

(after! elfeed
  (setq elfeed-search-filter "@1-month-ago +unread"))

(defadvice elfeed-search-update (before nullprogram activate)
  (let ((feed (elfeed-db-get-feed "http://export.arxiv.org/api/query?search_query=cat:math.OC&start=0&max_results=300&sortBy=submittedDate&sortOrder=descending")))
    (setf (elfeed-feed-title feed) "arXiv optimization")))

(after! elfeed
  (map! :map elfeed-show-mode-map
        :n "q" #'elfeed-search-quit-window))

(after! elfeed
  (map! :map elfeed-search-mode-map
        :n "i" #'elfeed-search-show-entry))

(map! :map elfeed-show-mode-map
      :after elfeed-show
      :n "h" #'elfeed-search-quit-window
      :n "N" #'elfeed-show-next
      :n "E" #'elfeed-show-prev
      :n "y" #'elfeed-show-yank)

(defun concatenate-authors (authors-list)
  "Given AUTHORS-LIST, list of plists; return string of all authors concatenated."
  (if (> (length authors-list) 1)
      (format "%s. %s et al." (substring (plist-get (nth 0 authors-list) :name) 0 1) (car (last (s-split " " (plist-get (nth 0 authors-list) :name)))))
    (format "%s. %s" (substring (plist-get (nth 0 authors-list) :name) 0 1) (car (last (s-split " " (plist-get (nth 0 authors-list) :name)))))))

(defun my-search-print-fn (entry)
  "Print ENTRY to the buffer."
  (let* ((date (elfeed-search-format-date (elfeed-entry-date entry)))
         (entry-score (elfeed-format-column (number-to-string (elfeed-score-scoring-get-score-from-entry entry)) 4 :right))
         (title (or (elfeed-meta entry :title)
                    (elfeed-entry-title entry) ""))
         (title-faces (elfeed-search--faces (elfeed-entry-tags entry)))
         (entry-authors (concatenate-authors
                         (elfeed-meta entry :authors)))
         (title-width (- (window-width) 10
                         elfeed-search-trailing-width))
         (title-column (elfeed-format-column
                        title 100
                        :left))
         (authors-column (elfeed-format-column entry-authors 40 :left)))
    (insert (propertize date 'face 'elfeed-search-date-face) " ")
    (insert entry-score "! ")
    (insert (propertize title-column
                        'face title-faces 'kbd-help title) " ")
    (insert (propertize authors-column
                        'kbd-help entry-authors) " ")
    ))

(setq! elfeed-search-print-entry-function #'my-search-print-fn)
(setq! elfeed-search-date-format '("%m-%d" 5 :left))

(defun ab/fetch-bibtex-and-paper-from-elfeed-entry ()
  "Fetch an arXiv paper into the local library from the current elfeed entry."
  (interactive)
  (let* ((link (elfeed-entry-link elfeed-show-entry))
         (match-idx (string-match "arxiv.org/abs/\\([0-9.]*\\)" link))
         (matched-arxiv-number (match-string 1 link)))
    (when matched-arxiv-number
      (message "Fetching pdf & bibtex entry from arXiv: %s" matched-arxiv-number)
      (arxiv-get-pdf-add-bibtex-entry matched-arxiv-number +biblio-default-bibliography-files +biblio-pdf-library-dir))))

(map! (:after elfeed
       (:map elfeed-search-mode-map
        :desc "Fetch arXiv paper to the local library" "A" #'ab/fetch-bibtex-and-paper-from-elfeed-entry)
       (:map elfeed-show-mode-map
        :desc "Fetch arXiv paper to the local library" "A" #'ab/fetch-bibtex-and-paper-from-elfeed-entry)))

;; needs to be after, otherwise it gets overwritten
(after! elfeed
  (map! :map elfeed-show-mode-map
        :n "A" #'ab/fetch-bibtex-and-paper-from-elfeed-entry))

(defun ab/fetch-bibtex-from-elfeed-entry ()
  "Fetch an arXiv paper into the local library from the current elfeed entry."
  (interactive)
  (let* ((link (elfeed-entry-link elfeed-show-entry))
         (match-idx (string-match "arxiv.org/abs/\\([0-9.]*\\)" link))
         (matched-arxiv-number (match-string 1 link)))
    (when matched-arxiv-number
      (message "Fetching bibtex entry from arXiv: %s" matched-arxiv-number)
      (arxiv-add-bibtex-entry matched-arxiv-number +biblio-default-bibliography-files))))

(map! (:after elfeed
       (:map elfeed-search-mode-map
        :desc "Fetch arXiv paper to the local library" "a" #'ab/fetch-bibtex-from-elfeed-entry)))

;; needs to be after, otherwise it gets overwritten
(after! elfeed
  (map! :map elfeed-show-mode-map
        :n "a" #'ab/fetch-bibtex-from-elfeed-entry))

(use-package! elfeed-score
  :after elfeed
  :config
  (elfeed-score-load-score-file "~/.doom.d/elfeed.score") ; See the elfeed-score documentation for the score file syntax
  (elfeed-score-enable)
  (define-key elfeed-search-mode-map "=" elfeed-score-map))

(setq avy-keys '(?a ?r ?s ?t ?d ?h ?n ?e ?i ?o))
