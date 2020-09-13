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
- has_many :items, through: items_users

## items テーブル

| Column       | Type    | Options     |
| ------       | ------  | ----------- |
| name         | string  | null: false |
| explanation  | text    | null: false |
| category     | integer | null: false |
| status       | integer | null: false |
| delivery-fee | integer | null: false |
| area         | integer | null: false |
| days         | integer | null: false |
| price        | integer | null: false |

### Association
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

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| postal_code   | reference  | null: false, foreign_key: true |
| city          | reference  | null: false                    |
| house_number  | reference  | null: false                    |
| building_name | reference  |                                |
| phone_number  | reference  | null: false, foreign_key: true |

### Association

- belongs_to :items_users

