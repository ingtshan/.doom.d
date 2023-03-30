;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; mac basic keybinding
(map!
 ;; "s-a" #'mark-whole-buffer
 ;; "s-v" #'yank
 ;; "s-c" #'kill-ring-save
 ;; "s-s" #'save-buffer
 ;; "s-l" #'goto-line
 "s-w" #'delete-frame
 "s-h" #'iconify-frame
 "s-z" #'undo
 "s-k" #'kill-this-buffer
 "s-n" #'make-second-screen-frame
 "s-q" #'save-buffers-kill-emacs
 ;; "s-;" #'vterm-pop-posframe-toggle
 "s-[" #'toggle-frame-maximized-or-fullframe
 "C-x w" #'winner-undo
 )


(defvar custom/extra-dir (expand-file-name "extra" doom-user-dir)
  "本地不同步配置所在文件夹")

(defun custom/doom-load-extra-file (file-name)
  (setq file-name (file-name-concat custom/extra-dir file-name ))
  (and (file-exists-p file-name) (load! file-name)))

;; 加载 `extra` 文件夹下指定的本地不同步的配置文件
(custom/doom-load-extra-file "local.el") ; 本地一般配置

;; proxy
;; (setq url-proxy-services
;;    '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
;;      ("http" . "127.0.0.1:1087")
;;      ("https" . "127.0.0.1:1087")))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "ingtshan"
;;       user-mail-address "ingtshan@proton.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; 在 extra/local.el 中根据本地字体具体设置
;; (setq doom-font (font-spec :family "Hack Nerd Font" :size 16)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; (when (modulep! :completion vertico +childframe)
;;   (use-package! vertico-posframe
;;    :init
;;    (setq vertico-posframe-font "Sarasa Term SC Nerd 14")))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-nord)
(setq doom-theme 'doom-snazzy)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! ace-window
  :defer t
  :init
  ;; (global-set-key [remap other-window] #'ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  ;; (setq aw-leading-char-face '(:foreground "green" :bold t))
  ;; (setq aw-font-size 20)
  (setq aw-scope 'global
        aw-background t))

(use-package translate-shell
  :config
  ;; <https://translate.google.com> is blocked in China for no apparent
  ;; reason. No one ever asked my option.
  ;; for mac you need proxychains-ng installed
  ;; (setq translate-shell-command "proxychains4 -q trans -t en %s"
  ;;       translate-shell-brief-command "proxychains4 -q trans -brief -t zh %s")
  (setq translate-shell-command "proxychains4 -q trans -t en+zh %s"
        translate-shell-brief-command "proxychains4 -q trans -brief -t zh+en %s"))

;; vue-mode
;; (lsp-install-server) vls for vue 2
(use-package! web-mode
  :config
  ;; Define vue-mode as kind of web-mode
  (define-derived-mode vue-mode web-mode "Vue")
  ;; (setq auto-mode-alist (delete '("\\.vue\\'" . web-mode) auto-mode-alist))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode) 'append))

;; (require 'web-mode)
;; ;; Define vue-mode as kind of web-mode
;; (define-derived-mode vue-mode web-mode "Vue")
;; (require 'cl-lib)
;; (setq auto-mode-alist (cl-remove-if (lambda (x) (equal x '("\\.vue\\'" . web-mode))) auto-mode-alist))
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode) 'append)

;;;inital misc
;; (let ((default-directory (expand-file-name "lisp" (borg-worktree "misc"))))
;;   (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path (expand-file-name "doom" (borg-worktree "misc")))

(require 'custom-functions)
(require 'init-aichat)        ; M-x aichat
(require 'init-blink-search)
(require 'init-sort-tab)

;; programming
(require 'wakatime-mode)
(require 'init-lsp-bridge)
(require 'init-ruby-on-rails)

(add-hook 'doom-first-buffer-hook
          (lambda ()
            ;; sort tab on
            (sort-tab-turn-on)
            ;; enable mode here
            (+global-word-wrap-mode)
            ;; show 80 charater boundary
            (set-face-foreground 'fill-column-indicator "gray40")
            (global-display-fill-column-indicator-mode)
            ;; tracking
            (global-wakatime-mode)
            ;; vimish fold mode
            (vimish-fold-global-mode 1)
            (global-company-mode -1)))

;;; last load
(load! "keybindings")
(custom/doom-load-extra-file "doom-last-config.el")
