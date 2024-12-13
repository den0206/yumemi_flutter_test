.PHONY: auto

.DEFAULT_GOAL := auto

auto: ## 自動生成コマンド
	@echo "╠ 自動生成ファイル"
	rm -rf lib/src/_generated
	rm -rf test/src/_generated
	fvm dart run build_runner build --delete-conflicting-outputs

## Make env GITHUB_TOKEN=github_pat_....
## PAT付与のenv 作成
env: ## 環境変数の作成
ifneq ($(wildcard .env),)
	@echo "╠ .env は既に存在しています"
else
	@echo "╠ 環境変数の作成"
	@echo "GITHUB_TOKEN=${GITHUB_TOKEN}" >> .env
endif