;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(defvar custom/extra-dir (expand-file-name "extra" doom-user-dir)
  "本地不同步配置所在文件夹")

(defun custom/doom-load-extra-file (file-name)
  (setq file-name (file-name-concat custom/extra-dir file-name ))
  (and (file-exists-p file-name) (load! file-name)))

;; 加载 `extra` 文件夹下指定的本地不同步的配置文件
(custom/doom-load-extra-file "local.el") ; 本地一般配置

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

;; (require 'web-mode)
;; ;; Define vue-mode as kind of web-mode
;; (define-derived-mode vue-mode web-mode "Vue")
;; (require 'cl-lib)
;; (setq auto-mode-alist (cl-remove-if (lambda (x) (equal x '("\\.vue\\'" . web-mode))) auto-mode-alist))
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode) 'append)

;;;inital misc
(let ((default-directory (expand-file-name "lisp" (borg-worktree "misc"))))
  (normal-top-level-add-subdirs-to-load-path))
(require 'init-aichat) ; M-x aichat

;; programming
(require 'init-lsp-bridge)
(require 'init-ruby-on-rails)

;;; 一般编辑
;;
;;; 文本跳转
;; 切换 window: next: C-x o select: M-o
;; 搜索 buffer: C-s
;;
;;; 编程编辑
;; 注释       : C-'
;;
;;; key bindings
;; remapping
(global-set-key [remap isearch-forward] #'consult-line) ; C-s
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "M-o") 'ace-window) ; installed by doom
;; memo
;; embark-act C-;

;;; last load
(custom/doom-load-extra-file "doom-after-init.el")
