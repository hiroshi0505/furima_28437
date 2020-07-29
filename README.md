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
- has_many :item_purchases
- belongs_to :address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| region_id     | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association
- belongs_to :users

## items テーブル

| Column              | Type    | Options     |
| ---------------     | ------  | ----------- |
| image               | img     | null: false |
| item_name           | string  | null: false |
| explanation         | string  | null: false |
| category_id         | integer | null: false |
| status_id           | integer | null: false |
| delivery_fee_id     | integer | null: false |
| shipping_origin_id  | integer | null: false |
| date_of_shipment_id | integer | null: false |
| price               | integer | null: false |

### Association
- belongs_to :users

## item_purchases テーブル

| Column    | Type    | Options     |
| --------- | ------  | ----------- |
| item_id   | integer | null: false |

### Association
- belongs_to :users
