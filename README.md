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
| nickname     | string | null: false |
| email     | string | null: false,unique: true |
| encrypted_password    | string | null: false |
| first_name | string | null: false |
| last_name     | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana     | string | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items
- has_many :records





## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name     | string | null: false |
| category_id    | integer | null: false |
| description    | text | null: false |
| item_status | integer | null: false |
| delivery_charge     | integer | null: false |
| delivery_area_id   | integer | null: false |
| delivery_day | integer | null: false |
| price  | integer | null: false |
| user  | references | null: false,foreign_key: true |



### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| reocord  | references | null: false, foreign_key: true |
| postal_code | string     | null: false                |
| delivery_area_id    | integer | null: false |
| municipality    | string | null: false |
| street_number | string     | null: false              |
| building_name    | string |    |
| phonenumber    | integer | null: false |


### Association

- belongs_to :record

