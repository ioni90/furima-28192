# テーブル設計

![ER図](https://gyazo.com/7257fee4e16ae27e1b7fdd07c62212a1)

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| last_name | string   |  null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_one :purchases


## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item_name | string | null: false |
| item_detail | text   |  null: false |
| category_id | integer | null: false |
| item_condition_id | integer | null: false |
| delivery_fee_id | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_date_id | integer | null: false |
| price | integer | null: false |

### Association

- belongs_to :users
- has_one :purchases
- belongs_to_active_hash :categories
- belongs_to_active_hash :item_conditions
- belongs_to_active_hash :delivery_fees
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipping_dates


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| ship_to_location | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :ship_to_locations


## ship_to_locations テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| postal_code | integer | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| address | string | null: false |
| building | string | null: false |
| phone_num | integer | null: false |

### Association

- belongs_to :users
- has_one :purchases
- belongs_to_active_hash :prefectures


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
