DRONES_DIR = $(shell git config "borg.drones-directory" || echo "lib")

-include $(DRONES_DIR)/borg/borg.mk

bootstrap-borg:
	@git submodule--helper clone --name borg --path $(DRONES_DIR)/borg \
	--url git@github.com:emacscollective/borg.git
	@cd $(DRONES_DIR)/borg; git symbolic-ref HEAD refs/heads/main
	@cd $(DRONES_DIR)/borg; git reset --hard HEAD

bootstrap-epkg:
	@git clone git@github.com:emacsmirror/epkgs.git $(DRONES_DIR)/epkgs

# 更新到 remote 最新 commit
update:
	./etc/shell/update_submodule.sh

# 初始化下载，更新到 .gitmodules 中指定的 commit
init:
	@git submodule update --init
	@git submodule foreach git reset --hard

# 修改 .gitmodules 后
sync:
	git submodule sync
