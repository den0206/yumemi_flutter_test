.PHONY: auto

.DEFAULT_GOAL := auto

auto: ## 自動生成コマンド
	@echo "╠ 自動生成ファイル"
	rm -rf lib/src/_generated
	rm -rf test/src/_generated
	fvm dart run build_runner build --delete-conflicting-outputs