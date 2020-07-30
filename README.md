# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| ----------     | ------ | ----------- |
| nickname       | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_furigana | string | null: false |
| last_furigana  | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| birthday       | date   | null: false |

### Association
- has_many :items

## items テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| item_name        | string  | null: false |
| explanation      | string  | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| delivery_fee_id  | integer | null: false |
| region_id        | integer | null: false |
| delivery_date_id | integer | null: false |
| price            | integer | null: false |
| user_id          | integer | null: false |

### Association
- belongs_to :users
- has_one :item_purchases

## item_purchases テーブル

| Column    | Type    | Options     |
| --------- | ------  | ----------- |
| item_id   | integer | null: false |
| user_id   | integer | null: false |

### Association
- belongs_to :items
- has_one :address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| region_id     | integer | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |
| item_id       | integer | null: false |

### Association
- belongs_to :item_purchases