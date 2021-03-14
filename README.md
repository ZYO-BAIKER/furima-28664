# README
・アプリ名
  フリマアプリ

・概要(このアプリでできることを書いて下さい)
  フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。
  自身が出品した商品は、編集と削除ができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

・本番環境(デプロイ先テストアカウント＆ID)
  接続先： http://54.150.212.63/
  認証ID/Pass:  admin / 2222
  
  テスト用アカウント:
      購入者用
        メールアドレス: s@s.com
        パスワード: sample2
      購入用カード情報
        番号：4242424242424242
        期限：12/24
        セキュリティコード：123
      出品者用
        メールアドレス名: sample@sample.com
        パスワード: sample2
  Githubリポジトリ
    https://github.com/ZYO-BAIKER/furima-28664


・制作背景(意図)
  これまで、学んできた内容の総復習として、作成する経験とスキルの定着のために挑戦しました。

・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
  https://gyazo.com/c19362122efd261422be8b25b427ce4b
  
・工夫したポイント
  コメント機能の使い易くするために、Action Cableを用いて、コメント投稿を非同期通信にしたことです。
  画面がリロードされることなく、快適な操作ができるように意識しました。
  また、このメッセージと共に投稿者名も表示され、投稿者のユーザーページへのリンクも付与しました。
  そして、投稿者本人なら投稿内容を削除できるようにしました。

・使用技術(開発環境)
  Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello/Java script

・課題や今後実装したい機能
  Action Cableでコメント投稿後、削除ボタンも一緒に出現する。
  しかし、現状だと削除ボタンを押すとNo routes Errorになってしまう。
  一度、リロードすれば問題なく削除できるので、この部分をなんとか修正したいです。

・DB設計

## usersテーブル
| Column             | Type   | Options     |
| -------- --------  | ------ | ----------- |
| nickname           | string | null: false | ## null: false＝カラムにnullを許可しない
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :sns_credentials

## itemsテーブル
| Column           | Type       | Options     |
| -------- --------| ------ ----| ----------- |
| name             | string     | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false |
| conditoin_id     | integer    | null: false |
| postage_payer_id | integer    | null: false |
| prefectures_id   | integer    | null: false |
| send_date_id     | integer    | null: false |
| description      | text       | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_many :comments
- has_one :purchase

 ## purchasesテーブル
| Column           | Type      | Options     |
| -------- --------| ------ ---| ----------- |
| user             | references| null: false, foreign_key: true  |
| item             | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column        | Type   | Options     |
| -------- -----| ------ | ----------- |
| post_code     | string | null: false |
| prefectures_id| integer| null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building_name | string |             |
| phone_number  | string | null: false |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## commentsテーブル
| Column           | Type       | Options     |
| -------- --------| ------     | ----------- |
| text             | string     | null: false |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :comment
- belongs_to :user

## snsCredentialテーブル
| Column   | Type       | Options     |
| ---------| ------     | ----------- |
| provider | string     | null: false |
| uid      | string     | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user