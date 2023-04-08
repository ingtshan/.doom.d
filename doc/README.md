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

### borg 修改 borg-initialize 加载 doom
添加到 borg-initialize 函数，将已经安装好的包加到 load-path 里以 borg build
``` emacs-lisp
  ;; 自定义 load-path
  (let ((start (current-time))
        (default-directory "~/.config/emacs/.local/straight/build-28.2"))
    (normal-top-level-add-subdirs-to-load-path)
    (setq default-directory "/Users/irmac/.config/emacs/lisp")
    (normal-top-level-add-subdirs-to-load-path)
    (add-to-list 'load-path "/Users/irmac/.config/doom/lib/lsp-bridge/acm")
    (message "Initializing straight-build...done (in %.3fs)"
             (float-time (time-subtract (current-time) start))))
  (defvar custom/borg-actived t
    "自定义的 borg 正在运行")
```

## .misc.d
### 安装过程 (如果需要重装)
``` emacs-lisp
(borg-assimilate "misc" "git@github.com:ingtshan/.misc.d.git")
```

