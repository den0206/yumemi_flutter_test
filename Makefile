.PHONY: auto

.DEFAULT_GOAL := auto

auto: ## 自動生成コマンド
	@echo "╠ 自動生成ファイル"
	rm -rf lib/src/_generated
	rm -rf test/src/_generated

## 多言語生成
	fvm flutter gen-l10n

## 自動生成ファイル
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

## シナリオテスト
## シナリオケース追加時は以下に追加して下さい
## todo: for文で実装検討
scenario:
	@echo "╠ 検索のシナリオテスト実行"
	fvm flutter drive \
	--driver=integration_test/test_driver/integration_test.dart \
	--target=integration_test/scenario/positive_case.dart
	@echo "╠ 検索結果0件のシナリオテスト実行"
	fvm flutter drive \
	--driver=integration_test/test_driver/integration_test.dart \
	--target=integration_test/scenario/negative_case.dart