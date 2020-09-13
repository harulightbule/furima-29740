# テーブル設計

## users テーブル

| Column         | Type   | Options                       |
| --------       | ------ | ------------------------------|
| nickname       | string | null: false, foreign_key: true|
| email          | string | null: false, foreign_key: true|
| password       | string | null: false, foreign_key: true|
| last-name      | string | null: false, foreign_key: true|
| first-name     | string | null: false, foreign_key: true|
| reading-last   | string | null: false, foreign_key: true|
| reading-first  | string | null: false, foreign_key: true|
| birthday       | date   | null: false, foreign_key: true|

### Association
- has_many :items_users
- has_many :item

## items テーブル

| Column       | Type    | Options      |
| ------       | ------  | -------------|
| name         | string  | null: false, |
| explanation  | text    | null: false, |
| category     | integer | null: false, |
| status       | integer | null: false, |
| delivery-fee | integer | null: false, |
| area         | integer | null: false, |
| days         | integer | null: false, |
| price        | integer | null: false, |

### Association
- belongs_to:user
- has_many :items_users
- has_many :users, through: items_users

## items_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | reference  | null: false, foreign_key: true |
| items  | reference  | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one:address



## address テーブル

| Column        | Type   | Options     |
| ------        | ------ | ----------- |
| postal_code   | string | null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building_name | string |             |
| phone_number  | string | null: false |

### Association

- belong_to :items_users

