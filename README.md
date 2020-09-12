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

## users_items テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | reference  | null: false, foreign_key: true |

### Association

- has_many :item_user

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

## items_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | reference  | null: false, foreign_key: true |

### Association

- belongs_to :item

## items_address テーブル
| Column  | Type       | Options      |
| ------  | ---------- | ------------ |
| address | reference  | null: false  |

### Association
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| postal_code   | references | null: false, foreign_key: true |
| prefectures   | references | null: false, foreign_key: true |
| city          | references | null: false, foreign_key: true |
| house_number  | references | null: false, foreign_key: true |
| building_name | references | null: false, foreign_key: true |
| phone_number  | references | null: false, foreign_key: true |

## address_items
| Column  | Type       | Options     |
| ------  | ---------- | ------------|
| item    | reference  | null: false |

### Association
- belongs_to :item