# Github Search
- [GitHub API(search/repositories)](https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#search-repositories) を利用して GitHub のリポジトリを検索するアプリです
   
   
## 仕様
- 要件: [Flutterエンジニアコードチェック](https://github.com/yumemi-inc/flutter-engineer-codecheck)

### 画面
#### ホーム画面/リポジトリ一覧画面
| iOS | Android(Dark) | iOS | Android(Dark) |
| --- | --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/791f5f62-db44-455c-9342-3e77298a3c56" width="300"> | <img src="https://github.com/user-attachments/assets/3df7f320-e4b3-49cb-a43b-08b9b45a4afe" width="300"> | <img src="https://github.com/user-attachments/assets/ecf1b00c-d1ae-4516-972d-41e1fc8a2f9c" width="300"> | <img src="https://github.com/user-attachments/assets/e516c74a-6cd8-436a-8c96-bab9b90880bd" width="300"> |


#### リポジトリ詳細画面/検索履歴画面
| iOS | iOS(Dark) | iOS | Android(Dark) |
| --- | --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/39e39467-07d1-4ee8-90c3-af09210c97fc" width="300"> | <img src="https://github.com/user-attachments/assets/364f3cad-852c-4b2f-873d-d3e1d4fd8293" width="300"> | <img src="https://github.com/user-attachments/assets/7fe7a093-e45e-4b98-a3b7-d1beb6d81aa8" width="300"> | <img src="https://github.com/user-attachments/assets/62b577d6-1766-44cd-9f67-c0b6c2c97e63" width="300"> |



#### 条件検索選択画面/多言語化対応
| Android | iOS(Dark) | 英語 | 日本語 | 中国語 |
| --- | --- | --- | --- |  --- |
| <img src="https://github.com/user-attachments/assets/ca747de5-5172-4bda-b2b8-f539fc84f6c5" width="300"> | <img src="https://github.com/user-attachments/assets/dbac9158-f31d-4148-a489-0e0c99c98bd7" width="300"> | <img src="https://github.com/user-attachments/assets/569d201b-4911-41f3-b541-aaf742397791" width="300"> | <img src="https://github.com/user-attachments/assets/352fee42-4620-4c4c-b92f-72d34ac42678" width="300"> | <img src="https://github.com/user-attachments/assets/71323791-b0e9-4547-a7ba-da054cbde1da" width="300"> |


#### オリエンテーション　対応
| ホーム画面 | リポジトリ一覧画面 | リポジトリ詳細画面 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/f7eaa282-61af-4cfa-aee4-dbdd2016b040" width="300"> | <img src="https://github.com/user-attachments/assets/e390ac1a-e026-4ab7-98c7-831f5edfdd93" width="300"> | <img src="https://github.com/user-attachments/assets/87e7966f-1c63-4343-87a9-d90371939213" width="300"> |
 - [【UI】 オリエンテーション対応 ](https://github.com/den0206/yumemi_flutter_test/pull/48) にも他画面の画像も添付があります


### 実装機能
- [x] リポジトリ検索
   - [x] [インクリメント検索](https://wa3.i-3-i.info/word1141.html)
     - [x] エラーダイアログ
   - [x] ページネーション
   - [x] 条件検索(Sort)
- [x] リポジトリ一覧表示
- [x] リポジトリ詳細画面表示
    - [x] リポジトリ名
    - [x] オーナーアイコン
    - [x] プロジェクト言語
    - [x] Star 数
    - [x] Watcher 数
    - [x] Fork 数
    - [x] Issue 数
  - [x] README表示
    - [x] 読み込みエラー画面
- [x] 検索履歴表示(最大5件)
- [x] 多言語化対応(日本語/英語/中国語)
- [x] DarkMode対応
- [x] オリエンテーション対応

# 開発環境
- Flutter 3.27.0
- Dart 3.6.0
    - fvm  3.2.1
    - cocoapods 1.16.2
- Android Studio Ladybug 2024.2.1
- Xcode 16.2

> [!IMPORTANT]
> - Flutter SDK 3.27.0 以上で動作をお願いします
> - 以下のバージョンの場合,[言語仕様相違](https://medium.com/flutter/whats-new-in-flutter-3-27-28341129570c)の為ビルドが失敗します

## プロジェクトの環境構築
本プロジェクトではFlutterのバージョン管理に[FVM](https://zenn.dev/altiveinc/articles/flutter-version-management)を利用しています。
あらかじめFVMと[Homebrew](https://brew.sh/index_ja)をインストールしてください。
また、AndroidStudioやVSCodeなどのエディタには事前にFlutter/Dartのプラグインをインストールしてください。 

### 自動生成ファイルに関して
当プロジェクトでは自動生成パッケージを通して作成されたファイルに関しては以下に格納しています
- アプリ
   - `lib/src/_generated`
- テスト
   - `test/src/_generated` 
> [!TIP]
> 当リポジトリではGit対象に加えていますが、実務では`*/_generated` を`.gitignore` に追加しています

## ビルド方法

#### ソースコード clone
  
```shell

git clone https://github.com/den0206/yumemi_flutter_test.git
```

#### GitHub の個人アクセストークンを取得/環境変数ファイルの作成

- 本アプリで使用する GitHub の[個人アクセストークン(PAT)](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)を取得して下さい。
- 引数を指定しプロジェクトDirにて以下コマンドを実行してください。

```shell
## 下記コマンドを叩くことで必要な環境変数が記述された状態の .env ファイルが生成されます

make env GITHUB_TOKEN=<PAT>
```

> [!NOTE]
> - PATを使用しなくてもアプリは使用できますが,リクエストに失敗する可能性があります

#### ビルド
- 対象端末/シュミレーターとの接続を確認する
- エラーが表示されないことを確認し以下コマンドを叩いて下さい

```shell
## ビルド

flutter run

## ※fvm global設定を行なっていない場合

fvm flutter run
```

### Makeコマンドについて

以下のコマンドがMakefileに定義されているので活用してください。

> [!TIP]
> 引数なしで`make`を叩くと、`make auto`が走るようになっています。

| コマンド          | 処理                                                          |
| ------------- | ----------------------------------------------------------- |
| make auto     | 自動生成ファイル作成コマンド |
| make env    | 環境変数の作成: **引数: GITHUB_TOKEN** |
| make scenario  | シナリオテストの実行|



``` shell
## 自動生成関連のコマンドを纏めています

## flutter gen-l10n(多言語ファイル生成)
## dart run build_runner build --delete-conflicting-outputs(自動生成ファイル)

make (auto)
```

## CI
- CI(継続的インテグレーション)は **Github Actions** を通して実行しています
   - MainへのPR作成時に 静的解析/テスト を通して実行しています

> [!WARNING]
> - CD(継続的デリバリー)は現時点では作成していません


# Integration Test

### 動作方法
- 対象端末/シュミレーターとの接続を確認します
- 統合テスト実行する場合,エラーが表示されないことを確認,以下コマンドを叩いて下さい

``` shell
## シナリオテスト実行コマンド
make scenario
```

### 統合テスト設計に関して
- 設計内容に関しては[PR](https://github.com/den0206/yumemi_flutter_test/pull/40) に纏めています
   - **テスト内容が `integration_test/scenario` 以下のシナリオケースを見ればわかるように意識しています**
  
### スクリーンショット
- シナリオテスト実行後,`integration_test/screenshots` にスクリーンショットが保存されます
  - Git対象外ディレクトリ

#### 動作例
| iOS | Android |
| --- | --- |
| <video src="https://github.com/user-attachments/assets/515a2991-18d5-42ab-b995-38c23ce9594c" width="500"> | <video src="https://github.com/user-attachments/assets/daa811d6-6dc0-4768-8242-2cb5155feec7" width="500"> |


## ブランチルール
### [GitHub Flow](https://docs.github.com/ja/get-started/using-github/github-flow) に準拠
  - 必須レビュワー設定なし
