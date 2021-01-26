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
| email     | string | null: false |
| password    | string | null: false |
| first_name | string | null: false |
| last_name     | string | null: false |
| furigana    | string | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items
- has_many :records
- has_one :address




## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_image   | integer | null: false |
| name     | string | null: false |
| category_id    | integer | null: false |
| item_status | string | null: false |
| delivery_charge     | integer | null: false |
| delivery_area   | string | null: false |
| delivery_day | date | null: false |
| price  | integer | null: false |
| user_id   | integer | null: false |



### Association

- belongs_to :users
- has_one :records

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id   | integer | null: false, foreign_key: true |
| address_id   | integer | null: false, foreign_key: true |
| item_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address
- belongs_to :items

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id   | integer | null: false, foreign_key: true |
| postal_code | string     | null: false                |
| prefecture    | string | null: false |
| municipality    | string | null: false |
| street_number | string     |                          |
| building_name    | string | null: false |
| phonenumber    | integer | null: false |


### Association

- belongs_to :users
- belongs_to :records

