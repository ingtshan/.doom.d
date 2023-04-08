;;; init/config.el -*- lexical-binding: t; -*-


(defvar custom/extra-dir (expand-file-name "extra" doom-user-dir)
  "本地不同步配置所在文件夹")

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
 "C-x w" #'winner-undo)

(defun custom/local-require (feature)
  (let* ((file-name (concat (symbol-name feature) ".el"))
         (file-name (file-name-concat custom/extra-dir file-name)))
    (and (file-exists-p file-name) (require feature file-name))))

(custom/local-require 'custom-first)

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
  (setq auto-mode-alist (delete '("\\.vue\\'" . web-mode) auto-mode-alist))
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
(load! "+keybindings")
(custom/local-require 'custom-last)
