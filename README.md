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
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name_kana| string | null: false |
|birth_date| string | null: false |

### Association
- has_many :items

## itemsテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| name             | string | null: false |
| image            | string | null: false |
| price            | integer| null: false |
| seller           | string | null: false |
| category         | string | null: false |
| conditoin        | string | null: false |
| postage_payer    | string | null: false |
| prefecture_seller| integer| null: false |
| send_date        | string | null: false |

### Association
- belongs_to :users
- has_many :comments

## commentsテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| text             | string | null: false |

### Association
- belongs_to :comments

 ## purchasesテーブル
| Column           | Type   | Options     |
| -------- --------| ------ | ----------- |
| buyer            | string | null: false |
| item             | string | null: false |

### Association
- belongs_to :items
- has_one :addresses
- has_one :credit_cards

## addressesテーブル
| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| post_code    | string | null: false |
| prefectures  | integer| null: false |
| city         | string | null: false |
| house_number | string | null: false |
| building_name| string |             |
| phone_number | string | null: false |

### Association
- belongs_to :purchases

## credit_cardテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- belongs_to :purchases