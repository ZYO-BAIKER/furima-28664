# README
1.エンティティの洗い出し
▼フリマアプリの機能
* ユーザー新規登録・ログイン/ログアウト機能
* 商品出品・購入
* 商品コメント機能（レビュー？）
* カテゴリー・ブランド機能
* クレジットカード登録・支払い機能
* マイページ機能・編集
* 商品検索機能

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

## itemsテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| name             | string | null: false |
| price            | integer| null: false |
| user            | references | null: false, foreign_key: true |
| category_id     | integer| null: false |
| conditoin_id    | integer | null: false |
| postage_payer_id | integer| null: false |
| prefectures_id| integer| null: false |
| send_date_id     | integer| null: false |
| description      | text   | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_many :comments
- has_one :purchase

## commentsテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| text             | string | null: false |
| user            | references | null: false, foreign_key: true |
| item             | references| null: false, foreign_key: true |

### Association
- belongs_to :comment
- belongs_to :user

 ## purchasesテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| user             | references| null: false, foreign_key: true  |
| item             | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| post_code    | string | null: false |
| prefectures_id| integer| null: false|
| city         | string | null: false |
| house_number | string | null: false |
| building_name| string |             |
| phone_number | string | null: false |
| purchase    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase