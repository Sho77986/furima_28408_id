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

| Column     | Type        | Options     |
| ---------- | ----------- | ----------  |
| nickname   | string      | null: false |
| email      | string      | null: false |
| password   | string      | null: false |

### Association
- has_many :items
- has_many :comments
- has_one  :purchases


## items テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| price      | string     | null: false |
| image      | string     | null: false |

### Association 
- belongs_to :users
- has_many   :comments


## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| content    | string     |

### Association
- belongs_to :users
- belongs_to :items


## purchases テーブル
| Column        | Type       | Options     |
| ----------    | ---------- | ----------- |
| real_name     | string     | null: false |
| card_number   | string     | null: false |
| card_deadline | string     | null: false |
| security_cord | string     | null: false |
| zip_code      | string     | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| call_number   | string     | null: false |


### association
- belongs_to :users
