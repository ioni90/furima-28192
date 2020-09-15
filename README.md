# テーブル設計

![ER図](https://gyazo.com/85bd1ce89bde40bc82692ce17b639914)

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
| birth_year_id | integer | null: false |
| birth_month_id | integer | null: false |
| birthday_id | integer | null: false |

### Association

- has_many :items
- has_one :credit_cards
- has_one :ship_to_locations
- belongs_to_active_hash :birth_years
- belongs_to_active_hash :birth_months
- belongs_to_active_hash :birthdays


## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| image | text | null: false |
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
- belongs_to_active_hash :categories
- belongs_to_active_hash :item_conditions
- belongs_to_active_hash :delivery_fees
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipping_dates


## credit_cards テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| card_num | integer | null: false |
| month_exp | integer | null: false |
| year_exp | integer | null: false |
| cvc | integer | null: false |

### Association

- belongs_to :users


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
