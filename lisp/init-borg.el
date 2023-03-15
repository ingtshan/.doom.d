;;; lisp/init-borg.el -*- lexical-binding: t; -*-
(setq epkg-repository (expand-file-name "lib/epkg" doom-user-dir))
(defun user/borg-initialize ()
  "初始化 borg-initialize"
  (add-to-list 'load-path (expand-file-name "lib/borg" doom-user-dir))
  (require 'borg)
  (borg-initialize))

;;用做第二个包管理
(add-hook! 'doom-after-init-hook #'user/borg-initialize)
;; (provide 'init-borg)
