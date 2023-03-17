# 文档

## borg(with epkg) install pacakges to `doom/lib`
### 安装过程 (如果需要重装)
``` shell
git submodule add --name borg git@github.com:emacscollective/borg.git lib/borg
git submodule add --name closql git@github.com:emacscollective/closql.git lib/closql
git submodule add --name emacsql git@github.com:skeeto/emacsql.git lib/emacsql
git submodule add --name compat https://git.sr.ht/~pkal/compat lib/compat
git submodule add --name llama https://git.sr.ht/~tarsius/llama lib/llama
git submodule add --name epkg git@github.com:emacscollective/epkg.git lib/epkg
git config -f .gitmodules submodule.emacsql.no-byte-compile emacsql-pg.el
echo /epkgs/ >> .gitignore
git add .gitignore .gitmodules
make build
git commit -m "Assimilate epkg and dependencies"
```

1. 搜索

## .misc.d
### 安装过程 (如果需要重装)
``` emacs-lisp
(borg-assimilate "misc" "git@github.com:ingtshan/.misc.d.git")
```
### ln -s from misc
example
``` shell
## add to .gitmodules
[submodule "misc-doom"]
	path = lib/misc-doom

## cd $dir/lib
ln -s lib/misc/lisp/doom misc-doom
```

## lsp-bridge
### 安装过程 (如果需要重装)
``` emacs-lisp
;;依赖
(custom/borg-assimilate "github" "tumashu/posframe")
(custom/borg-assimilate "github" "jrblevin/markdown-mode")
(custom/borg-assimilate "github" "joaotavora/yasnippet")

(borg-assimilate "popon" "git@codeberg.org:akib/emacs-popon.git")
(custom/borg-assimilate "github" "twlz0ne/acm-terminal")
(borg-compile "acm" (expand-file-name "lib/lsp-bridge/acm" doom-user-dir))
(borg-compile (expand-file-name "lib/lsp-bridge" doom-user-dir))

(custom/borg-assimilate "github" "manateelazycat/lsp-bridge")
```

## ai-chat
### 安装过程 (如果需要重装)
``` emacs-lisp
;;依赖
;; (custom/borg-assimilate "github" "chuntaro/emacs-async-await"); MELPA 包(async-await)， 依赖 iter2, promise (依赖 async request (依赖 Deferred))
(custom/borg-assimilate "github" "ahyatt/emacs-websocket")

(custom/borg-assimilate "github" "xhcoding/emacs-aichat")
(custom/borg-assimilate "github" "manateelazycat/mind-wave")
```
