;;; init/config.el -*- lexical-binding: t; -*-

;;;---------------------------------------------------;;;
;;;       +borg - secondary package manager           ;;;
;;;---------------------------------------------------;;;
(setq epkg-repository (expand-file-name "lib/epkgs" doom-user-dir))

(defun custom/borg-initialize ()
  "初始化 borg-initialize"
  (add-to-list 'load-path (expand-file-name "lib/borg" doom-user-dir))
  (require 'borg)
  (borg-initialize))

;;用 borg 做第二个包管理
(custom/borg-initialize) ; 初始化
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
