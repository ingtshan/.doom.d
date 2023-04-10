;;; doom/+keybindings.el -*- lexical-binding: t; -*-

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

(defun custom/call-with-region (fun-name)
  "call fun-name with region check"
  (if (use-region-p)
      (funcall fun-name
               (buffer-substring-no-properties
                (region-beginning) (region-end)))
    (call-interactively fun-name)))

;;; how to set key of evil-normal-state-map(or others)
;; (define-key evil-visual-state-map "f" #'indent-for-tab-command)
;; (general-define-key :states '(visual) ; '(normal visual insert emacs)
;;                     "TAB" #'indent-for-tab-command)
;;; helper
(map! :v "C-f" #'indent-for-tab-command
      ;; "s-;" #'vterm-pop-posframe-toggle
      ;; "s-[" #'custom/toggle-frame-maximized-or-fullframe
      ;;"C-x w" #'winner-undo
      :n "C-t" #'(lambda () (interactive) (custom/call-with-region #'custom/translate-shell-brief))
      :leader :desc "vertico-posframe-cleanup" :n "h 0" #'(lambda () (interactive)
                                                            (message "do vertico-posframe-cleanup")
                                                            (vertico-posframe-cleanup))
      :desc "projectile-invalidate-cache" :n "h 9" #'projectile-invalidate-cache
      :desc "projectile-invalidate-cache" :n "\\" #'custom/save-all-buffers)

;;; 一般编辑
;; tab 切换 tabify, untabify
;;; 文本跳转
;; 切换 window: next: C-x o select: M-o
;; 搜索 buffer: C-s
;; 搜索 buffer SPC s (a: blink-search, s(b): buffer, B: all buffer, S: search with point)
;; 搜索 file   SPC s (d: current-dir, D: other-dir)
;;; 编程编辑
;; 注释       : C-'
;;
;;; key bindings
(map! :leader
      ;; +git
      :n "gu" #'magit-diff-unstaged ;; 配合 maigt-save-hunk-point SPAC g s
      ;; :desc "blink search all" :n "st" #'(lambda () (interactive) (custom/call-with-region #'custom/translate-shell-brief))

      ;; +file
      :n "fd" #'find-file-in-current-directory-by-selected

      ;; +search
      :desc "blink search all" :n "st" #'(lambda () (interactive) (custom/call-with-region #'translate-shell))
      :desc "search Google" :n "sg" #'(lambda(arg)
                                        (interactive (list (if (use-region-p)
                                                               (doom-thing-at-point-or-region)
                                                             (read-string "Search Google for: "))))
                                        (+lookup/online arg "Google"))
      :desc "blink search all" :n "sa" #'blink-search
      :desc "ripgrep" :n "sr" #'custom/deadgrep-or-finish-editing
      :n "sf" #'find-file-in-project-by-selected
      :n "sF" #'consult-locate
      :n "sR" #'custom/jump-backward-respect-deadgrep
      :n "sm" #'consult-mark
      :n "sM" #'consult-bookmark
      :desc "insert git emoji" :n "ig" #'gitmoji-insert-emoji

      ;; +opne
      :desc "open aichat" :n "oi" #'aichat-bingai-chat)

;; remapping
(global-set-key [remap +default/find-in-notes] #'consult-notes) ; C-s
(global-set-key [remap isearch-forward] #'consult-line) ; C-s
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "M-o") 'ace-window) ; installed by doom
(global-set-key (kbd "C-S-o")  #'custom/jump-backward-respect-deadgrep)
