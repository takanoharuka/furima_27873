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


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

- has_many :items  
- has_many :comments
- has_many :favorites
- has_many :buyers

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|text|null: false|
|information|text|null: false|
|price|integer|null: false|
|category|integer|null: false|
|item_condition|integer|null: false|
|shipping_charge|integer|null: false|
|shipping_area|integer|null: false|
|delivery_date|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

- belongs_to :user
- has_many :comments
- has_many :favorites
- has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :delivery_date

## shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|item_id|integer|null: false, foreign_key: true|

- belongs_to :item
- belongs_to_active_hash :prefecture

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :item




