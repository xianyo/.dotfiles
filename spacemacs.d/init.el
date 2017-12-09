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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                       auto-completion-return-key-behavior 'complete
                       auto-completion-tab-key-behavior 'cycle
                       auto-completion-complete-with-key-sequence nil
                       auto-completion-complete-with-key-sequence-delay 0.1
                       auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                       auto-completion-enable-snippets-in-popup t
                       auto-completion-enable-sort-by-usage t
                       :disabled-for org markdown)
     better-defaults
     emacs-lisp
     ;;prodigy
     imenu-list
     ;;search-engine
     ;;(ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;;ranger
     ;;git
     ;; latex
     ;; restructuredtext
     ;; org
     (shell :variables
             shell-default-height 50
             shell-default-shell 'multi-term
             shell-default-term-shell "/bin/bash"
             shell-default-position 'full)
     ;; (spell-checking :variables spell-checking-enable-by-default nil)
     ;; syntax-checking
     ;;version-control
     ;;fasd
     shell-scripts
     (java :variables java-backend nil)
     semantic
     c-c++
     ;; python
     ;; php
     ;; html
     ;; javascript
     (markdown :variables
                markdown-live-preview-engine 'vmd)
     gtags
     treemacs
     ;; (han :variables
     ;;        han-enable-youdao-dict t
     ;;        han-enable-fcitx nil
     ;;        han-org-line-spacing 0.2)
     (chinese :variables chinese-enable-fcitx t
              chinese-enable-youdao-dict t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

    (setq exec-path-from-shell-check-startup-files nil)

    (setq configuration-layer--elpa-archives
          '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
            ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
            ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

    ;; https://github.com/syl20bnr/spacemacs/issues/2705
    ;; (setq tramp-mode nil)
    (setq tramp-ssh-controlmaster-options
          "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

    ;; (setq
    ;;  eclim-eclipse-dirs "~/soft/eclipse"
    ;;  eclim-executable "~/soft/eclipse/eclim"
    ;;  ;; Specify the workspace to use by default
    ;;  eclimd-default-workspace "~/work/workspace"
    ;;  ;; Whether or not to block emacs until eclimd is ready
    ;;  eclimd-wait-for-process t)

    ;; ;; 设置neotree
    ;; (setq neo-toggle-window-keep-p t)       ;; 刷新时保持光标在当前位置
    ;; (setq neo-show-hidden-files nil)        ;; 不显示隐藏文件
    ;; (setq neo-force-change-root t)          ;; 当root改变时，是否强制相应改变而不需要询问
    ;; (setq neo-persist-show t)               ;; C-x 1 时neotree window不关闭
    ;; (setq split-window-preferred-function 'neotree-split-window-sensibly)

    (setq-default evil-escape-delay 0.3)
    (setq-default evil-escape-key-sequence "jk")
    (remove-hook 'find-file-hooks 'vc-find-file-hook)
    (setq vc-handled-backends ())
    (setq powerline-default-separator nil)
    (setq projectile-enable-caching t)

    (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
    (defun un-indent-by-removing-4-spaces ()
      "remove 4 spaces from beginning of of line"
      (interactive)
      (save-excursion
        (save-match-data
          (beginning-of-line)
          ;; get rid of tabs at beginning of line
          (when (looking-at "^\\s-+")
            (untabify (match-beginning 0) (match-end 0)))
          (when (looking-at (concat "^" (make-string tab-width ?\ )))
            (replace-match "")))))

    ;; https://github.com/syl20bnr/spacemacs/issues/7749
    ;; (defun spacemacs/ivy-persp-switch-project (arg)
    ;;   (interactive "P")
    ;;   (ivy-read "Switch to Project Perspective: "
    ;;             (if (projectile-project-p)
    ;;                 (cons (abbreviate-file-name (projectile-project-root))
    ;;                       (projectile-relevant-known-projects))
    ;;               projectile-known-projects)
    ;;             :action (lambda (project)
    ;;                       (let ((persp-reset-windows-on-nil-window-conf t))
    ;;                         (persp-switch project)
    ;;                         (let ((projectile-completion-system 'ivy)
    ;;                               (old-default-directory default-directory))
    ;;                           (projectile-switch-project-by-name project)
    ;;                           (setq default-directory old-default-directory))))))

    ;; http://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
    ;; I prefer using the "clipboard" selection (the one the
    ;; typically is used by c-c/c-v) before the primary selection
    ;; (that uses mouse-select/middle-button-click)

    (if (version<= emacs-version "24.5")
        (setq x-select-enable-clipboard t)     ;; copy and paste with other program
      (setq select-enable-clipboard t))        ;; 25.1 版本改成这个变量了

    ;; If emacs is run in a terminal, the clipboard- functions have no
    ;; effect. Instead, we use of xsel, see
    ;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
    ;; program for getting and setting the contents of the X selection"
    (unless window-system
      (when (getenv "DISPLAY")
        ;; Callback for when user cuts
        (defun xsel-cut-function (text &optional push)
          ;; Insert text to temp-buffer, and "send" content to xsel stdin
          (with-temp-buffer
            (insert text)
            ;; I prefer using the "clipboard" selection (the one the
            ;; typically is used by c-c/c-v) before the primary selection
            ;; (that uses mouse-select/middle-button-click)
            (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
        ;; Call back for when user pastes
        (defun xsel-paste-function()
          ;; Find out what is current selection by xsel. If it is different
          ;; from the top of the kill-ring (car kill-ring), then return
          ;; it. Else, nil is returned, so whatever is in the top of the
          ;; kill-ring will be used.
          (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
            (unless (string= (car kill-ring) xsel-output)
              xsel-output )))
        ;; Attach callbacks to hooks
        (setq interprogram-cut-function 'xsel-cut-function)
        (setq interprogram-paste-function 'xsel-paste-function)
        ;; Idea from
        ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
        ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
    ))

    ;; (push '(hkgo
    ;;         :name "hkgo"
    ;;         :url "https://www.google.com.hk/search?q=%s")
    ;;       search-engine-alist)

    ;; (push '(baidu
    ;;         :name "baidu"
    ;;         :url "https://www.baidu.com/s?wd=%s")
    ;;       search-engine-alist)

    ;; (setq-default google-translate-enable-ido-completion t)
    ;; (setq-default google-translate-default-source-language "en")
    ;; (setq-default google-translate-default-target-language "zh-CN")

    ;;文泉驿正黑
    (if (display-graphic-p)
        (dolist (charset '(kana han cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font) charset
                            (font-spec :family "WenQuanYi Zen Hei" :size 16))))

    (if (display-graphic-p)
        (spacemacs//set-monospaced-font "Source Code Pro" "WenQuanYi Zen Hei" 16 16))

    (defun cygwin-explore ()
      "Find the current buffer in Windows explorer.exe"
      (interactive)
      (cond
       ;; In buffers with file names
       ((buffer-file-name)
        (shell-command (concat "explorer.exe /e,/select, \"$(cygpath -w \"" buffer-file-name "\")\"")))
       ;; In dired-mode
       ((eq major-mode 'dired-mode)
        (shell-command (concat "explorer.exe /e, \"$(cygpath -w \"" (dired-current-directory) "\")\"")))
       ;; fallback to default-directory
       (t
        (shell-command (concat "explorer.exe /e, \"$(cygpath -w \"" default-directory "\")\"")))
       ))

    ;; dired just one buffer
    ;; (put 'dired-find-alternate-file 'disabled nil)

    ;; 延迟加载
    ;; (with-eval-after-load 'dired
    ;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

    (setq helm-echo-input-in-header-line nil)
    (remove-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)

    ;;Startup emacs server
    ;;(unless (server-running-p) (server-start))

    ;;Don’t ask me when kill process buffer
    (setq kill-buffer-query-functions
          (remq 'process-kill-buffer-query-function
                kill-buffer-query-functions))

    (setq system-time-locale "en_US")
    (set-language-environment "UTF-8")
    (setq-default default-buffer-file-coding-system 'utf-8)
    ;; (setq coding-system-for-write 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-selection-coding-system 'utf-8)
    (setq locale-coding-system 'utf-8)
    (prefer-coding-system 'gb18030)
    (prefer-coding-system 'utf-8)

    ;;(gpm-mouse-mode -1)
    ;;(xterm-mouse-mode -1)


    ;;add auto format paste code
    (dolist (command '(yank yank-pop))
      (eval
       `(defadvice ,command (after indent-region activate)
          (and (not current-prefix-arg)
               (member major-mode
                       '(emacs-lisp-mode
                         lisp-mode
                         clojure-mode
                         scheme-mode
                         haskell-mode
                         ruby-mode
                         rspec-mode
                         python-mode
                         c-mode
                         c++-mode
                         objc-mode
                         latex-mode
                         js-mode
                         plain-tex-mode))
               (let ((mark-even-if-inactive transient-mark-mode))
                 (indent-region (region-beginning) (region-end) nil))))))

    ;; ---禁止备份
    (setq make-backup-files nil)

    ;; 不生成临时文件
    (setq-default make-backup-files nil)

    ;; Bind clang-format-region to C-M-tab in all modes:
    (global-set-key [C-M-tab] 'clang-format-region)

    (spacemacs/set-leader-keys "fl" 'projectile-find-file-in-directory)

    (global-set-key (kbd "C-SPC") nil)
    (global-set-key (kbd "C-c SPC") 'set-mark-command)

	(global-set-key (kbd "C-x C-z") 'kill-emacs)
	(define-key evil-motion-state-map (kbd "C-x C-z") 'evil-emacs-state)
	(define-key evil-motion-state-map (kbd "C-z") 'suspend-frame)

	(define-key evil-normal-state-map (kbd "<down-mouse-1>") 'evil-insert)

	;; evilnc-comment-operator
    (define-key evil-normal-state-map (kbd "go") 'evil-jump-forward)
    (define-key evil-normal-state-map (kbd "gc") 'spacemacs/comment-or-uncomment-lines)
    (define-key evil-normal-state-map (kbd "gr") 'helm-resume)
    (define-key evil-normal-state-map (kbd "gb") 'helm-mini)

	(define-key evil-normal-state-map (kbd "gj") 'evil-avy-goto-line)
    (define-key evil-normal-state-map (kbd "gk") 'kill-this-buffer)
    (define-key evil-normal-state-map (kbd "gh") 'helm-filtered-bookmarks)
    (define-key evil-normal-state-map (kbd "gl") 'projectile-find-file-in-directory)

    (define-key evil-normal-state-map (kbd "gp") 'helm-show-kill-ring)
    (define-key evil-normal-state-map (kbd "gs") 'save-buffer)
    (define-key evil-normal-state-map (kbd "gt") 'helm-find-files)

    (setq-default c-basic-offset 4)
    (setq c-default-style "linux")

	(setq spacemacs-show-trailing-whitespace nil)

	(global-set-key (kbd "C-j") 'next-line)
	(global-set-key (kbd "C-k") 'previous-line)
	(global-set-key (kbd "C-h") 'backward-char)
	(global-set-key (kbd "C-l") 'forward-char)

	(defun evil-paste-after-from-0 ()
	  (interactive)
	  (let ((evil-this-register ?0))
		(call-interactively 'evil-paste-after)))

	(define-key evil-visual-state-map "p" 'evil-paste-after-from-0)

	;; search in directory on RET by default (instead of opening dired)
	(require 'helm)
	(defun helm-find-files-navigate-forward (orig-fun &rest args)
	  (if (file-directory-p (helm-get-selection))
		  (apply orig-fun args)
		(helm-maybe-exit-minibuffer)))
	(advice-add 'helm-execute-persistent-action :around #'helm-find-files-navigate-forward)
	(define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)

	;; backspace goes one dir up
	(defun helm-find-files-navigate-back (orig-fun &rest args)
	  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
		  (helm-find-files-up-one-level 1)
		(apply orig-fun args)))
	(advice-add 'helm-ff-delete-char-backward :around #'helm-find-files-navigate-back)

	(setq user-full-name "zhuxy")
	(setq user-mail-address "zhuxyo@gmail.com")

    ;;** tab key & indent
    (setq tab-always-indent 'complete)

    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 4)

    (setq tab-stop-list
          (loop for i from 4 to 120 by tab-width collect i))

    ;;*** abs-indent: to mimic other simple editor's indent/unindent
    ;; unlike emacs' default settings, this would not use syntax-based indent, but:
    ;;  - if region selected, indent/unindent the region (tab-width)
    ;;    * the region mark would not deactivated automatically
    ;;  - if no region selected, <TAB> would
    ;;    * if cursor lies in line leading, always indent tab-width
    ;;    * if cursor lies in word ending and `tab-always-indent' is `complete', try complete
    ;;    * otherwise, always insert a TAB char or SPACEs
    ;;  - if no region selected, <S-TAB> would
    ;;    * if cursor lies in line leading, always unindent tab-width
    ;;    * otherwise, the cursor would move backwards (tab-width)
    ;; Note: this implementation would hornor `tab-always-indent', `indent-tabs-mode' and `tab-with'.

    (defvar abs-indent-complete-function 'dabbrev-expand
      "The function used in `abs-indent' for completion.")
    (make-variable-buffer-local 'abs-indent-complete-function)

    (defun abs-indent (arg)
      "Absolutely indent current line or region. Mimic other editors' indent."
      (interactive "P")
      (let ( (width (or arg tab-width)) )
      (if mark-active
          ;;DONE: how to restore region after `indent-rigidly'
          (let ( (deactivate-mark nil) )
            (indent-rigidly (region-beginning) (region-end) width))
        (let ( (pt           (point))
              (pt-bol       (line-beginning-position))
              (pt-bol-nonws (save-excursion (back-to-indentation) (point))) )
          (if (<= pt pt-bol-nonws)  ;;in leading whitespaces
              (progn
                (back-to-indentation)
                (if (looking-at "$")  ;;all chars in this line are whitespaces or tabs
                      (indent-to (+ (current-column) width))
                    (progn
                      (indent-rigidly pt-bol (line-end-position) width)
                      (back-to-indentation))))
            (if (and (eq tab-always-indent 'complete)
                    (looking-at "\\>"))
                (call-interactively abs-indent-complete-function)
              (if indent-tabs-mode
                  (insert-char ?\t 1)
                (insert-char ?  width))))))))

    (defun abs-unindent (arg)
      "Absolutely unindent current line or region."
      (interactive "P")
      (if mark-active
          (let ( (deactivate-mark nil) )
            (indent-rigidly (region-beginning) (region-end) (- tab-width)))
        (let ( (pt           (point))
              (pt-bol       (line-beginning-position))
              (pt-bol-nonws (save-excursion (back-to-indentation) (point))) )
          (if (> pt pt-bol-nonws)  ;;in content
              (move-to-column (max 0 (- (current-column) tab-width)))
            (progn
              (back-to-indentation)
              (backward-delete-char-untabify (min tab-width (current-column))))))))

    (defun hack-tab-key ()
      (interactive)
      (local-set-key (kbd "TAB") 'abs-indent)
      ;; S-TAB not work when in visual mode
      ;; (local-set-key (kbd "S-TAB") 'abs-unindent)
      (local-set-key (kbd "M-I") 'abs-unindent)
      )

    ;; to used it
    ;; (add-hook 'prog-mode-hook 'hack-tab-key)
    (add-hook 'text-mode-hook 'hack-tab-key)

    (global-set-key (kbd "M-i") 'abs-indent)
    ;; S-TAB not work when in visual mode
    ;; (global-set-key (kbd "S-TAB") 'abs-unindent)
    (global-set-key (kbd "M-I") 'abs-unindent)


    (evil-leader/set-key "d" 'avy-goto-char-in-line)
    (spacemacs/declare-prefix "o" "Chinese")
    (evil-leader/set-key "od" 'find-by-pinyin-dired)
    (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point+)
    (evil-leader/set-key "ol" 'org-cliplink)
    (evil-leader/set-key "oc" 'avy-goto-char)
    (evil-leader/set-key "ow" 'avy-goto-char-2)

    ;; (fcitx-aggressive-setup)
    (global-set-key (kbd "C-\\") 'toggle-input-method)
    (setq default-input-method "pyim")
    (setq pyim-default-scheme 'quanpin)

    ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
    ;; 我自己使用的中英文动态切换规则是：
    ;; 1. 光标只有在注释里面时，才可以输入中文。
    ;; 2. 光标前是汉字字符时，才能输入中文。
    ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
    ;; (setq-default pyim-english-input-switch-functions
    ;;               '(pyim-probe-dynamic-english
    ;;                 pyim-probe-isearch-mode
    ;;                 pyim-probe-program-mode
    ;;                 pyim-probe-org-structure-template))

    ;; (setq-default pyim-punctuation-half-width-functions
    ;;               '(pyim-probe-punctuation-line-beginning
    ;;                 pyim-probe-punctuation-after-punctuation))

    ;; 开启拼音搜索功能
    ;; (setq pyim-isearch-mode t)

    ;; 使用 pupup-el 来绘制选词框
    (setq pyim-page-tooltip 'popup)

    ;; 选词框显示5个候选词
    (setq pyim-page-length 5)

    (setq pyim-dicts
          '((:name "bigdict" :file "~/.dotfiles/spacemacs.d/pyim/pyim-bigdict.pyim")))

    ;; 让 Emacs 启动时自动加载 pyim 词库
    (add-hook 'emacs-startup-hook
              #'(lambda () (pyim-restart-1 t)))

    ;; (global-set-key (kbd "M-i") 'pyim-convert-code-at-point)

    (ac-config-default)
    (setq ac-auto-start 4)
)

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
