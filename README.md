# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ------------|
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

| Column       | Type      | Options                        |
| ------       | ------    | -------------------------------|
| name         | string    | null: false                    |
| explanation  | text      | null: false                    |
| category     | integer   | null: false                    |
| status       | integer   | null: false                    |
| delivery-fee | integer   | null: false                    |
| area         | integer   | null: false                    |
| days         | integer   | null: false                    |
| price        | integer   | null: false                    |
| user_id      | reference | null: false, foreign_key: true |
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

| Column        | Type      | Options                          |
| ------------- | --------- | ---------------------------------|
| postal_code   | string    | null: false                      |
| city          | string    | null: false                      |
| house_number  | string    | null: false                      |
| building_name | string    |                                  |
| phone_number  | string    | null: false                      |
| item_user_id  | reference | null: false, foreign_key: true   |

### Association

- belong_to :items_users

