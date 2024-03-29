;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom install'
;; will do this for you). The `doom!' block below controls what modules are
;; enabled and in what order they will be loaded. Remember to run 'doom refresh'
;; after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :input
       ;;chinese
       ;;japanese

       :checkers
       (spell
        +hunspell
        +flyspell)       ;; TODO: switch to spell-fu eventually
       (syntax)
       ;; grammar

       :completion
       (company
        +childframe)           ; the ultimate code completion backend
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       (ivy               ; a search engine for love and life
        )
       
       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       ;; doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;;indent-guides     ; highlighted indent columns
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       ;; (popup            ; tame sudden yet inevitable temporary windows
       ;;  +all             ; catch all popups that start with an asterix
       ;;  +defaults)       ; default popup rules
       (ligatures +extra)       ; replace bits of code with pretty symbols
       ;;tabs              ; an tab bar for Emacs
       ;;treemacs          ; a project drawer, like neotree but cooler
       ;;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       ;; vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       ;;zen               ; distraction-free coding or writing


       :editor
       (evil +everywhere); come to the dark side, we have cookies
       ;; file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;lispy             ; vim for lisp, for people who dont like vim
       ;; multiple-cursors    ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;; rotate-text       ; cycle region at point between text candidates
       snippets            ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +ranger)             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; a consistent, cross-platform shell (WIP)
       ;;shell             ; a terminal REPL for Emacs
       ;;term              ; terminals in Emacs
       vterm             ; another terminals in Emacs

       :tools
       debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ein               ; tame Jupyter notebooks with emacs
       eval              ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       lsp
       magit             ; a git porcelain for Emacs
       biblio              ; bibtex-completion
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;; pdf               ; pdf enhancements
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp

       :lang
       ;;cc                ; C/C++/Obj-C madness
       data              ; config/data formats
       emacs-lisp          ; drown in parentheses
       ess                 ; emacs speaks statistics
       ;;(go +lsp)         ; the hipster dialect
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
       (julia +lsp)        ; a better, faster MATLAB
       (latex              ; writing papers in Emacs has never been so fun
        +ref
        ;; +lsp            ; currently doesn't let me use reftex
        +latexmk)
       markdown            ; writing docs for people to ignore
       (org                ; organize your plain life in plain text
        ; +dragndrop       ; drag & drop files/images into org buffers
        ; +ipython         ; ipython/jupyter support for babel
        ; +pandoc          ; export-with-pandoc support
        ; +present         ; using org-mode for presentations
        +journal
        +roam2
        +noter             ; annotate pdfs
        +pretty)
       (python             ; beautiful is better than ugly
        +lsp
        +conda)
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh                 ; she sells {ba,z,fi}sh shells on the C xor
        +lsp)

       :email
       mu4e                ; WIP
       notmuch             ; WIP
       ;;(wanderlust +gmail) ; WIP

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       (rss)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;(write            ; emacs for writers (fiction, notes, papers, etc.)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
