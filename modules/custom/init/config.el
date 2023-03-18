;;; init/config.el -*- lexical-binding: t; -*-

;; (setenv "PATH" (concat  "/opt/homebrew/bin/" ":" (getenv "PATH")))

;;;---------------------------------------------------;;;
;;;       +borg - secondary package manager           ;;;
;;;---------------------------------------------------;;;
(setq epkg-repository (expand-file-name "lib/epkgs" doom-user-dir))

;;用 borg 做第二个包管理
(add-to-list 'load-path (expand-file-name "lib/borg" doom-user-dir))
(require 'borg)
;;(package-initialize)
(borg-initialize)
