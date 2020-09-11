# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| reading  | string | null: false |
| birthday | integer| null: false |

### Association

- has_many :item_users
- has_many :purchase_users

## items テーブル

| Column       | Type   | Options     |
| ------       | ------ | ----------- |
| image        | string | null: false |
| item-name    | string | null: false |
| explanation  | text   | null: false |
| category     | string | null: false |
| status       | string | null: false |
| delivery-fee | string | null: false |
| area         | string | null: false |
| days         | string | null: false |
| price        | integer| null: false |

### Association
- has_one :purchase

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| users  | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :purchase

## purchase テーブル
| Column    | Type       | Options     |
| ------    | ---------- | ------------|
|           |            |             |

### Association
- has_one :address

## purchase_item テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| purchase  | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## purchase_user テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| purchase  | references | null: false, foreign_key: true |
| users     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| postal_code   | references | null: false, foreign_key: true |
| prefectures   | references | null: false, foreign_key: true |
| city          | references | null: false, foreign_key: true |
| house_number  | references | null: false, foreign_key: true |
| building_name | references | null: false, foreign_key: true |
| phone_number  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
