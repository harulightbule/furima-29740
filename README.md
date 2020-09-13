# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last-name      | string | null: false |
| first-name     | string | null: false |
| reading-last   | string | null: false |
| reading-first  | string | null: false |
| birthday       | date   | null: false |

### Association
- has_many :items_users
- has_many :item

## items テーブル

| Column       | Type    | Options                        |
| ------       | ------  | -------------------------------|
| name         | string  | null: false, foreign_key: true |
| explanation  | text    | null: false, foreign_key: true |
| category     | integer | null: false, foreign_key: true |
| status       | integer | null: false, foreign_key: true |
| delivery-fee | integer | null: false, foreign_key: true |
| area         | integer | null: false, foreign_key: true |
| days         | integer | null: false, foreign_key: true |
| price        | integer | null: false, foreign_key: true |

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

