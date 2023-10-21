# アプリケーション名
自分でできる心理療法

# アプリケーション概要
ACT（アクセプタンス&コミットメント・セラピー）心理療法を使い、セルフケアができる。

# URL
[https://mental-app.onrender.com](https://mental-app.onrender.com/)

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：mentalapp
- メールアドレス：test@test.com
- パスワード：test00

# 利用方法
## セルフケア
- トップページのヘッダーからユーザー新規登録を行う。
- 「エクササイズをする」ボタンを押し、各質問に沿って項目を入力する。

# アプリケーションを作成した背景
近頃「モヤモヤする力」が注目されている。  
ビジネスシーンでは、効率的に結論を出すことが重要視される。  
この延長線上で、日常生活でも答えを出すことが求められる面がある。  
しかし、人生における生き方や人間関係、恋愛などの悩みは答えが出ない問題である。  
答えが出ない問題に対して、「悩むのは当たり前」という前提で、問題を分析し、対処する方法を世の中に提供したい、という思いからアプリを開発した。

# 実装予定の機能
今後タグ機能、Googleアカウント連携機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/25eef7f0c84dc7d000f22525ce10ce95.png)](https://gyazo.com/25eef7f0c84dc7d000f22525ce10ce95)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/91fc6cdbd92d0a2a7fb7f5ab870a44cc.png)](https://gyazo.com/91fc6cdbd92d0a2a7fb7f5ab870a44cc)

# 開発環境
- フロントエンド：HTML/CSS、JavaScript
- バックエンド：Ruby on Rails
- テスト：Rspec

# ローカルでの動作方法
以下のコマンドを順に実行。

```ruby
% git clone https://github.com/iguanakun/mental-app.git
% cd mental-app
% bundle install
```

# 工夫したポイント
- トップページのエクササイズの文章は寄り添うような言葉、かつわかりやすさを考慮し、クリックしてもらいやすさを意識した。
- 重要な個人情報を扱うので、Rails 7のActiveRecordEncryptionを利用し、データベースのデータを暗号化した。