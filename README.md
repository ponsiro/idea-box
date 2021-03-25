## アプリケーション名
**「idea-box」**

## アプリケーション概要
このアプリケーションは、ユーザーが今思っていることや画像を投稿するアプリケーションです。  

**実装済み機能**  
- ユーザー新規登録・ログイン機能  
- ideaの投稿、編集、削除
- 画像投稿機能  
- 画像プレビュー機能
- ideaに対してのコメント投稿  
- コメント削除機能
- ideaに対してのいいね機能（非同期）  
- ユーザー情報編集機能（アイコン、プロフィールの設定）  
- idea検索機能  

**実装予定の機能**  
- ユーザー名での検索機能  
- 動画投稿機能  
- 複数枚の画像投稿機能  
- ユーザーのフォロー機能  
- 無限スクロールの実装  
- 自身がいいねした投稿の表示機能  
- いいね件数のランキング表示機能（1日、3日、1週間などの期間で時間で区切る） 
- タグ付け機能 

## URL
https://idea-box-34549.herokuapp.com/  

## テスト用アカウント
**User-1**  
- Email  
test@test.com  
- Password  
111111  

**User-2**  
- Email  
test2@test.com  
- Passwoud  
111111  

## 利用方法  
1　ユーザー登録をします。  
2　トップ画面右下の投稿フォームから、画像やアイデアの投稿をします。  
3　投稿に対してハートマークをクリックすることでいいねをすることができます。  
4 　投稿文か投稿された画像をクリックすると投稿詳細画面に遷移し、コメントを入力することができます。  
5　投稿者名をクリックするとユーザーの詳細画面時遷移し、そのユーザーの投稿一覧を閲覧することができます。  
6　自身の詳細画面に遷移すると、アカウントの情報を編集することができ、アイコン、プロフィール文（300文字まで）を設定できます。  
7　トップページの上部では検索ワードを含む投稿を検索することができます。

## 目指した課題解決
今の人が感じていること、不満に思っていることやこんなものがあったらいいなという考えを持っている人のアイディアを投稿する場や、そのアイディアへの議論の場を設けることにより、新しいサービスや商品が生まれてくることを期待しました。  

## 要件定義
優先順位（高：3、中：2、低：1) | 機能 | 目的 | 詳細 | ストーリー（ユースケース) | 見積もり（所要時間） 
-|-|-|-|-|-
3 |idea投稿機能|ideaを投稿するため|ideaを投稿できます。|フォームにideaの内容を書いて送信ボタンを押したら投稿できる。|4時間
3|user登録機能|user登録を行うため|投稿者などを判別できます|ログイン、ログアウトボタンを押すとそれぞれ機能する。名前、email、passwordなどを入力することにより新規登録することができる。|2時間
2|いいね機能|ideaに対していいねを押せる|気に入った投稿にワンクリックで反応できる。|いいと思った投稿にはいいねを押せることで手軽に意思表示ができる。|8時間
2|コメント機能|ideaに対してコメントをすることができる|ログインしているユーザーだけコメントをすることができる|そのideaについて気になるとこなどを、コメント入力フォームに書いてコメントボタンを押すとコメントを書くことができる|8時間
1|タグ付け機能|ideaにタグをつけることができる|タグ付けによる検索管理|キーワードを入力して、自分に興味のある分野についてのideaを見ることができるようになる。発信者も誰に読んでもらいたいかを示すことができる。|15時間
2|投稿検索機能|ideaを検索できる|興味のあるワードで検索できる|検索欄で興味のあるideaやワードに関することを検索でき容易に探せる|4時間
2|写真投稿機能|ideaに写真を複数枚つけて投稿できる|投稿をする前にプレビューで表示されるようにする|写真をみてイメージを浮かべやすくすることができる。写真で説明の補完ができる|3時間
1|無限スクロール|投稿されたものがスクロールによって次々と表示されるようにするため |最初に読み込まれる投稿分だけ表示し、スクロールをするとさらに投稿が表示されるように実装することによってユーザーがストレスなく閲覧できるようにするため|ページの遷移なしで、スクロールによって新しい情報が次々と表示されることによって、ユーザーの利便性の向上を図れる。|16時間
1|ユーザー検索機能|ユーザーの検索を行うため|ユーザーの名前で検索できることで、よりユーザーの利便性が高まる。|ユーザー名で検索することによりすぐに見つけたい情報にアクセスできる|6時間
1|動画投稿機能|動画を投稿できるようにするため|動画を投稿できることで画像より詳しく説明ができたり、音声の投稿も可能となり説明が捗る。|動画投稿により、よりわかりやすくideaの説明ができユーザーの利便性が高まる。|5時間
1|ユーザーのフォロー機能|お気に入りのユーザーと繋がれる|自分の興味のある人についてフォローすることで検索するより簡単にその人の投稿を見ることができる。|気になるユーザーをフォローすることにより、面白い発想する人の投稿を素早くチェックできる。|8時間
2|自身がいいねした投稿の表示機能|いいねした投稿を見返すことができる|ユーザー詳細機能この機能を実装することにより、自身がどんな投稿に対していいねを押しているのかがわかる。|自身がいいねを押したものを確認することによりどんなものに興味があるのかがわかる。|4時間
2|いいね件数のランキング表示機能|どの投稿に人気があるのかを可視化するため|1日、3日、1週間などで区切って、いいねの多いランキングをつけて表示することにより人気の投稿を知ることができる。|いいねランキングが表示できることによって、いい投稿に巡り会う可能性が高まる。いろいろな人の目に触れることで、投稿が実現する可能性が高まる。|10時間
***  

## 実装した機能についてのGIFと説明  
### トップ画面
![トップ画面](https://i.gyazo.com/332c2a966fe808daa19b36c3310d0a60.png)
### 投稿機能
[![Image from Gyazo](https://i.gyazo.com/8ddcf714dc03085054ca682c42374f88.gif)](https://gyazo.com/8ddcf714dc03085054ca682c42374f88)
### 画像投稿＆プレビュー機能
[![Image from Gyazo](https://i.gyazo.com/2cc10d13e375941dfa58089bb9435b51.gif)](https://gyazo.com/2cc10d13e375941dfa58089bb9435b51)
### コメント投稿＆削除機能
[![Image from Gyazo](https://i.gyazo.com/64ab094d5cb1f3b22c685384c2c62562.gif)](https://gyazo.com/64ab094d5cb1f3b22c685384c2c62562)
### いいね機能（非同期）
[![Image from Gyazo](https://i.gyazo.com/d70a42ac558c0a719540f0dc2ff3bfe8.gif)](https://gyazo.com/d70a42ac558c0a719540f0dc2ff3bfe8)
### ユーザー情報編集機能
[![Image from Gyazo](https://i.gyazo.com/c164985f1ef5a4ca4dfe5d1d3032cda5.gif)](https://gyazo.com/c164985f1ef5a4ca4dfe5d1d3032cda5)
### 投稿検索機能
[![Image from Gyazo](https://i.gyazo.com/4f60b67484b3b400f59f3d1656649bb7.gif)](https://gyazo.com/4f60b67484b3b400f59f3d1656649bb7)

# テーブル設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/b13f86e3f7be824ea57ff2cdfafa600f.png)](https://gyazo.com/b13f86e3f7be824ea57ff2cdfafa600f)

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| name               | string  | null: false               |
| profile            | text    |                           |


### Association

- has_many :ideas
- has_many :comments
- has_many :likes

## ideas テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| content                | string    | null: false                    |
| user                   | reference | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes
- has_many :comments
- has_many :idea_tags
- has_many :tags, through: :idea_tags


## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| idea      | reference | null: false, foreign_key: true |
| text      | text      | null: false                    |

### Association

- belongs_to :user
- belongs_to :idea



## likes テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| idea     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
_ belongs_to :idea

## tagsテーブル

| Column   | Type      | Options     |
| -------- | --------- | ------------|
| name     | string    |             |

### Association

- has_many :idea_tags
- has_many :ideas, through: idea_tags

## idea_tagsテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| item     | reference | null: false, foreign_key: true |
| tag      | reference | null: false, foreign_key: true |

### Association

- belongs_to :idea
- belongs_to :tag