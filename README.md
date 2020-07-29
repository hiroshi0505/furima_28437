# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items
- has_many :sold items
- belongs_to :credit card
- belongs_to :address

## address テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| Postal code  | integer | null: false |
| Prefectures  | string  | null: false |
| city         | integer | null: false |
| address      | string  | null: false |
| phone number | integer | null: false |

### Association
- belongs_to :users

## credit card テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| number          | integer | null: false |
| expiration date | integer | null: false |
| cvc             | integer | null: false |

### Association
- belongs_to :users

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| price           | integer | null: false |
| image           | img     | null: false |
| comment         | string  | null: false |
| Exhibitor       | string  | null: false |
| Category        | string  | null: false |
| Status          | string  | null: false |
| Delivery fee    | string  | null: false |
| Shipping origin | string  | null: false |
| Date of shipment| string  | null: false |

### Association
- belongs_to :users

## sold items テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| price           | integer | null: false |
| image           | img     | null: false |
| comment         | string  | null: false |
| Exhibitor       | string  | null: false |
| Category        | string  | null: false |
| Status          | string  | null: false |
| Delivery fee    | string  | null: false |
| Shipping origin | string  | null: false |
| Date of shipment| string  | null: false |

### Association
- belongs_to :users
