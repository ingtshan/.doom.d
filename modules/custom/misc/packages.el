;;; packages.el --- packages for init                -*- lexical-binding: t; -*-

;; for more recipe format check https://github.com/radian-software/straight.el#the-recipe-format
;;
;; (package! tree-sitter-langs
;;   :recipe (:host github
;;            :repo "ingtshan/tree-sitter-langs"))

(package! leetcode)
;; (package! netease-cloud-music :recipe
;;   (:host github :repo "SpringHan/netease-cloud-music.el" :files ("*.el")))
(package! consult-notes)

;; for lsp-bridge
(package! posframe)
(package! markdown-mode)
(package! yasnippet)
;; cannot install by straight
;; (package! popo) ;; eamcsmirror
;; (package! popo
;;   :recipe (:repo "https://codeberg.org/akib/emacs-popon.git"))
;; (package! popo
;;   :recipe (:host codeberg :repo "akib/emacs-popon"))

;; for aichat
(package! async-await)
(package! websocket
  :recipe (:host github :repo "ahyatt/emacs-websocket"))
