# テーブル設計

![ER図](https://gyazo.com/fde8a28415d2cc887765dfd553cede5c)

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false, default: "" |
| last_name | string   |  null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :purchases


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

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship_to_location


## ship_to_locations テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| address | string | null: false |
| building | string | |
| phone_num | string | null: false |
| purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture


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
