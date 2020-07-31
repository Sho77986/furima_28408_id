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

| Column         | Type        | Options     |
| -----------    | ----------- | ----------  |
| nickname       | string      | null: false |
| first_name     | string      | null: false |
| family_name    | string      | null: false |
| first_name_furigana     | string      | null: false |
| family_name_furigana    | string      | null: false |
| birthday       | date        | null: false |
| email          | string      | null: false |
| password       | string      | null: false |

### Association
- has_many :items
- has_many :comments
- has_many  :purchases



## items テーブル

| Column           | Type       | Options     |
| ----------       | ---------- | ----------- |
| name             | string     | null: false |
| user_id          | integer    | null: false |
| price            | string     | null: false |
| image            | string     | null: false |
| item_status_id      | integer     | null: false |
| shipping_charges_id | integer     | null: false |
| shipping_area_id    | integer     | null: false |
| shipping_days_id    | integer     | null: false |
| category_id         | integer     | null: false |

### Association 
- belongs_to :users
- has_many   :comments
- has_one    :address



## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| content    | string     |
| user_id    | integer    | null: false, foreign_key: true |
| item_id    | integer    | null: false, foreign_key: true |


### Association
- belongs_to :users
- belongs_to :items



## purchases テーブル
| Column        | Type       | Options     |
| ----------    | ---------- | ----------- |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |





## address テーブル

|Column         | Type       | Options     |
| ----------    | ---------- | ----------- |
| zip  _code_id    | string    | null: false |
| prefectures_id   | string    | null: false |
| city_id          | string    | null: false |
| address_id       | string   | null: false |
| building      | string     | null: false |
| call_number   | string     | null: false |

### association
- belongs_to :items
