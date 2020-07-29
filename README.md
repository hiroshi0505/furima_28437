# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| ----------     | ------ | ----------- |
| nickname       | string | null: false |
| first name     | string | null: false |
| last name      | string | null: false |
| first furigana | string | null: false |
| last furigana  | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| birthday       | string | null: false |

### Association
- has_many :items
- has_many :sold items
- belongs_to :credit card
- belongs_to :address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal code   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building name | string  |             |
| phone number  | string  | null: false |

### Association
- belongs_to :users

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| image           | img     | null: false |
| item name       | string  | null: false |
| explanation     | string  | null: false |
| price           | integer | null: false |

### Association
- belongs_to :users

## item_purchases テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| item id         | integer | null: false |


### Association
- belongs_to :users
