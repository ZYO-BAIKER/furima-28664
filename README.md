# アプリ名
  フリマアプリ

# 概要
  フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。
  自身が出品した商品は、編集と削除ができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

# 本番環境(デプロイ先テストアカウント＆ID)
  ### ○接続先： http://54.150.212.63/ <br>
  ### ○認証ID/Pass:  admin / 2222 <br>
  <br>
  ### ○テスト用アカウント:<br>
       ・購入者用<br>
         メールアドレス: s@s.com<br>
         パスワード: sample2<br>
         <br>
       ・購入用カード情報<br>
         番号：4242424242424242<br>
         期限：12/24<br>
         セキュリティコード：123<br>
         <br>
       ・出品者用<br>
         メールアドレス名: sample@sample.com<br>
         パスワード: sample2<br>
         <br>
 ### ○Githubリポジトリ<br>
      https://github.com/ZYO-BAIKER/furima-28664 <br>


# 制作背景(意図)
  これまで、学んできた内容の総復習として、作成する経験とスキルの定着のために挑戦しました。

# DEMO
  https://gyazo.com/c19362122efd261422be8b25b427ce4b
  
# 工夫したポイント
  コメント機能の使い易くするために、Action Cableを用いて、コメント投稿を非同期通信にしたことです。<br>
  画面がリロードされることなく、快適な操作ができるように意識しました。<br>
  また、このメッセージと共に投稿者名も表示され、投稿者のユーザーページへのリンクも付与しました。<br>
  そして、投稿者本人なら投稿内容を削除できるようにしました。

# 使用技術(開発環境)
  Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello/Java script

# 課題や今後実装したい機能
  Action Cableでコメント投稿後、削除ボタンも一緒に出現する。<br>
  しかし、現状だと削除ボタンを押すとNo routes Errorになってしまう。<br>
  一度、リロードすれば問題なく削除できるので、この部分をなんとか修正したいです。<br>

# DB設計

## usersテーブル
| Column             | Type   | Options     |<br>
| -------- --------  | ------ | ----------- |<br>
| nickname           | string | null: false |<br>
| email              | string | null: false |<br>
| encrypted_password | string | null: false |<br>
| family_name        | string | null: false |<br>
| first_name         | string | null: false |<br>
| family_name_kana   | string | null: false |<br>
| first_name_kana    | string | null: false |<br>
| birth_date         | date   | null: false |<br>

### Association
- has_many :items<br>
- has_many :purchases<br>
- has_many :sns_credentials<br>

## itemsテーブル
| Column           | Type       | Options     |<br>
| -------- --------| ------ ----| ----------- |<br>
| name             | string     | null: false |<br>
| price            | integer    | null: false |<br>
| user             | references | null: false, foreign_key: true |<br>
| category_id      | integer    | null: false |<br>
| conditoin_id     | integer    | null: false |<br>
| postage_payer_id | integer    | null: false |<br>
| prefectures_id   | integer    | null: false |<br>
| send_date_id     | integer    | null: false |<br>
| description      | text       | null: false |<br>

### Association
- belongs_to :user<br>
- belongs_to :item<br>
- has_many :comments<br>
- has_one :purchase<br>

 ## purchasesテーブル
| Column           | Type      | Options                        |<br>
| -------- --------| ------ ---| -------------------------------|<br>
| user             | references| null: false, foreign_key: true |<br>
| item             | references| null: false, foreign_key: true |<br>

### Association
- belongs_to :user<br>
- belongs_to :item<br>
- has_one :address<br>

## addressesテーブル
| Column        | Type       | Options     |<br>
| --------------| ---------- | ----------- |<br>
| post_code     | string     | null: false |<br>
| prefectures_id| integer    | null: false |<br>
| city          | string     | null: false |<br>
| house_number  | string     | null: false |<br>
| building_name | string     |             |<br>
| phone_number  | string     | null: false |<br>
| purchase      | references | null: false, foreign_key: true |<br>

### Association
- belongs_to :purchase

## commentsテーブル
| Column           | Type       | Options     |<br>
| -----------------| -----------| ----------- |<br>
| text             | string     | null: false |<br>
| user             | references | null: false, foreign_key: true |<br>
| item             | references | null: false, foreign_key: true |<br>

### Association
- belongs_to :comment<br>
- belongs_to :user<br>

## snsCredentialテーブル
| Column   |    Type    | Options                        |<br>
|----------|------------| ------------------------------ |<br>
| provider | string     | null: false                    |<br>
| uid      | string     | null: false, foreign_key: true |<br>
| user     | references | null: false, foreign_key: true |<br>

### Association
- belongs_to :user
