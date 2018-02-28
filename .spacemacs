;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(go
     csv
     elixir
     python
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     better-defaults
     emacs-lisp
     ruby
     yaml
     ruby-on-rails
     haskell
     javascript
     react
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      :disabled-for
                      ocaml
                      )
     themes-megapack
     html
     clojure
     git
     markdown
     rust
     ;; spell-checking
     ocaml
     reason
     ;; syntax-checking
     version-control
     evil-commentary
     scala
     spacemacs-prettier
     colors
     ;; nlinum
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(osx-clipboard
     (reason-mode
      :location (recipe
                 :repo "reasonml-editor/reason-mode"
                 :fetcher github
                 :files ("reason-mode.el" "refmt.el" "reason-indent.el" "reason-interaction.el")))
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(git-gutter+ git-gutter-fringe+)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         spacemacs-dark
                         cyberpunk
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   )
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (add-to-list 'auto-mode-alist '("\\.axlsx\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  ;; (setq auto-mode-alist (rassq-delete-all 'js2-mode auto-mode-alist))
  ;; (add-to-list 'auto-mode-alist '("\\.js\\" . react))
  (setq-default ruby-version-manager 'rvm)
  (setq enh-ruby-add-encoding-comment-on-save nil)
  (setq ruby-insert-encoding-magic-comment nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq ruby-test-runner 'rspec)
  (setq js-switch-indent-offset 2)
  (setq js2-indent-switch-body t)
  (setq go-tab-width 4)
  (setq-default dotspacemacs-consfiguration-layers '(ruby
                                                     ruby-on-rails
                                                     enh-ruby-mode
                                                     robe
                                                     inf-ruby
                                                     ruby-tools
                                                     yaml
                                                     clojure
                                                     markdown-mode
                                                     auto-completion))
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; (defun pj-run-after-save ()
  ;;   "Run script to sync on save"
  ;;   (if (and (projectile-project-p)
  ;;            (file-executable-p (projectile-file-truename "./node_modules/.bin/prettier"))
  ;;            (eq major-mode 'react-mode))
  ;;       (shell-command (projectile-file-truename "./node_modules/.bin/prettier --write") buffer-file-name)
  ;;     )
  ;;   )

  ;; (add-hook 'after-save-hook 'pj-run-after-save)
  (setq-default fci-rule-column 120)
  (setq-default js2-basic-offset 2
                js-indent-level 2)
  (setq neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "^__pycache__$"))
  (add-hook 'enh-ruby-mode-hook
            'fci-mode)
  (add-hook 'python-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook (lambda ()
                              (modify-syntax-entry ?_ "w")
                              (setq flycheck-checker 'ruby-rubylint)))
  (add-hook 'haml-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'yaml-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'rust-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'react-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'reason-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'javascript-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'sql-mode-hook (lambda () (modify-syntax-entry ?_ "w" sql-mode-syntax-table)))
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
  (add-hook 'css-mode-hook (lambda () (rainbow-mode)))
  (add-hook 'sass-mode-hook (lambda () (rainbow-mode)))

  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'react-mode-hook 'prettier-js-mode)

  (setq magit-no-confirm '(stage-all-changes))
  (setq magit-push-current-set-remote-if-missing "origin")
  (setq helm-ag-use-agignore t)
  (setq osx-clipboard-mode t)
  (setq helm-buffer-max-length 50)
  (setq require-final-newline t)
  (add-hook 'after-init-hook (lambda () (neotree-show)))
  ;; (add-hook 'after-init-hook (lambda () (select-window-1)))
  (add-hook 'after-init-hook (lambda () (split-window-horizontally)))
  (setq js2-strict-missing-semi-warning nil)
  (setq vc-follow-symlinks nil)
  (setq dotspacemacs-check-for-update nil)

  (eval-after-load "neotree"
    '(setq neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$"))
    )

  (remove-hook 'anaconda-mode-process-fail-hook)
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)

  ;; (add-hook 'reason-mode-hook (lambda () (setq-local company-mode nil)))
  ;; (add-hook 'reason-mode-hook (lambda () (company-mode -1)) 'append)
 )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (global-linum-mode)
  (setq dotspacemacs-line-numbers t)
  (setq dotspacemacs-check-for-update nil)
  (setq create-lockfiles nil)

  (setq css-indent-offset 2)

  ;; (global-company-mode '(not reason))
  (modify-syntax-entry ?_ "w")
  ;; (global-set-key (kbd "C-y") 'copy-region-to-cut-buffer)
  (add-to-list 'spacemacs-indent-sensitive-modes 'sql-mode)

  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (shell-command-on-region (region-beginning) (region-end) "pbcopy")
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (insert (shell-command-to-string "pbpaste"))
      )
    )
  (evil-leader/set-key "o y" 'copy-to-clipboard)
  (evil-leader/set-key "o p" 'paste-from-clipboard)
  (setq recentf-save-file (format "/tmp/recentf.%s" (emacs-pid)))


  (require 'reason-mode)
  (require 'private/keybindings)
  (setq ensime-startup-notification nil)
  (setq company-idle-delay nil)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (white-sand-theme rebecca-theme pos-tip prettier-js noflet go-guru go-eldoc git-gutter-fringe fringe-helper git-gutter exotica-theme ghub let-alist evil-commentary ensime sbt-mode scala-mode diff-hl company-go go-mode utop tuareg caml ocp-indent merlin reason-mode winum unfill madhat2r-theme fuzzy flycheck-credo flyspell-correct-helm flyspell-correct auto-dictionary toml-mode racer cargo rust-mode nlinum-relative nlinum powerline rake pcre2el markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode flycheck flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree diminish autothemer web-completion-data dash-functional tern ghc haskell-mode hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue clojure-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f s company dash pkg-info epl helm avy helm-core async auto-complete popup package-build magit-gh-pulls github-search github-clone gist github-browse-file gh marshal logito pcache ht csv-mode ob-elixir org flycheck-mix alchemist elixir-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox osx-clipboard orgit organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-ghci company-ghc company-cabal company-anaconda column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-mode rainbow-identifiers color-identifiers-mode white-sand-theme rebecca-theme pos-tip prettier-js noflet go-guru go-eldoc git-gutter-fringe fringe-helper git-gutter exotica-theme ghub let-alist evil-commentary ensime sbt-mode scala-mode diff-hl company-go go-mode utop tuareg caml ocp-indent merlin reason-mode winum unfill madhat2r-theme fuzzy flycheck-credo flyspell-correct-helm flyspell-correct auto-dictionary toml-mode racer cargo rust-mode nlinum-relative nlinum powerline rake pcre2el markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode flycheck flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree diminish autothemer web-completion-data dash-functional tern ghc haskell-mode hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue clojure-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f s company dash pkg-info epl helm avy helm-core async auto-complete popup package-build magit-gh-pulls github-search github-clone gist github-browse-file gh marshal logito pcache ht csv-mode ob-elixir org flycheck-mix alchemist elixir-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox osx-clipboard orgit organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-ghci company-ghc company-cabal company-anaconda column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
