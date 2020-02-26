# freemarket_sample_68b DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false ,unique: true|
|email|string|null: false , unique: true|
|password|string|null: false , unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|f_first_name|string|null: false|
|f_last_name|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
### Association
- has_one :adress
- has_one :credit
- has_many :items

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|:null: false|
|address|string|null: false|
|building|string| |
|phone_number|integer|null: false|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|card_number|integer||
|year|integer|null: false|
|month|integer|null: false|
|security_number|integer|null: false|
### Association
- belongs_to :user


## searchesテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|foreign_key :true|
|brand_id|integer|foreign_key :true|
### Association
- belongs_to :category
- belongs_to :brand

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
- has_many :searches
- has_many :items
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
- has_many :searches
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|brand_id|integer|foreign_key :true|
|category_id|integer|foreign_key :true|
|name|string|null: false|
|description|text|null: false|
|state|text|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_days|string|null: false|
|price|interger|null: false|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer||foreign_key :true|
|image|text|unique: true|
### Association
- belongs_to :item
