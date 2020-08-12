# テーブル設計

## users テーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
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
- has_many :purchases

## items テーブル

| Column           | Type    | Options     |
|------------------|---------|-------------|
| name             | string  | null: false |
| explanation      | text    | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| delivery_fee_id  | integer | null: false |
| region_id        | integer | null: false |
| delivery_date_id | integer | null: false |
| price            | integer | null: false |
| user_id          | integer | null: false |
| image            | string  | null: false |

### Association
- belongs_to :user
- has_one :purchase
- has_one :address

## purchases テーブル

| Column    | Type    | Options     |
|-----------|---------|-------------|
| item_id   | integer | null: false |
| user_id   | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item

## address テーブル

| Column        | Type    | Options     |
|---------------|---------|-------------|
| postal_code   | string  | null: false |
| region_id     | integer | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |
| item_id       | integer | null: false |

### Association
- belongs_to :item