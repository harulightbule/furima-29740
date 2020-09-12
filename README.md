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
- has_many :items
- has_many :address_users
- has_many :users, through: address_users

## items テーブル

| Column       | Type    | Options                       |
| ------       | ------  | -----------                   |
| name         | string  | null: false                   |
| explanation  | text    | null: false                   |
| category     | integer | null: false                   |
| status       | integer | null: false                   |
| delivery-fee | integer | null: false foreign_key: true |
| area         | integer | null: false foreign_key: true |
| days         | integer | null: false foreign_key: true |
| price        | integer | null: false foreign_key: true |

### Association
- belongs_to :users

## address テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| postal_code   | references | null: false, foreign_key: true |
| city          | references | null: false                    |
| house_number  | references | null: false                    |
| building_name | references | null: false                    |
| phone_number  | references | null: false, foreign_key: true |

### Association

- has_many :address_users
- has_many :users, through: address_users

## address_users テーブル
| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | reference  | null: false, foreign_key: true |
| address  | reference  | null: false, foreign_key: true |

### Association

- belongs_to :address
- belongs_to :user