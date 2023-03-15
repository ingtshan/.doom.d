# 文档

## borg(with epkg) install pacakges to `doom/lib`
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

1. 搜索
