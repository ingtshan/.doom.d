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

;;;---------------------------------------------------;;;
;;;       tool functions                              ;;;
;;;---------------------------------------------------;;;

(defun custom/borg-assimilate (host repo)
  "use borg install package"
  (let* ((package-name (and (string-match "/\\(.+\\)$" repo)
                            (match-string 1 repo)))
         (url (format (pcase host
                        ;; add support here
                        ("github"  "git@github.com:%s.git")
                        ) repo)))
    (borg-assimilate package-name url)))
