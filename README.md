## users　テーブル

|Column|Type|Options|
|nickname|string|null: false|
|email_addless|string|null: false|
|password|string|null: false|
|name|string|null: false|
|date_of_birth|string|null: false|
##Association
has_many :items

##items テーブル
|goods|string|null: false|
|category|string|null: false|
|price|string|null: false|
|seller|string|null: false|

##Association
has_one :items
##addless テーブル
|addless|string|null: false, foreign_key: true |
##Association
has_one :orders
##ordersテーブル
|orders|string|null: false, unique: true |
##Association
has_one :users