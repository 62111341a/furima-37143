## users　テーブル

|Column|Type|Options|
|nickname|string|null: false|
|email|string|null: false unique:true|
|encrypted_password|string|null: false|
|surname|string|null: false|
|name|string|null: false|
|furigana_surname|string|null: false|
|furigana_name|string|null: false|
|date_of_birth|date|null: false|
##Association
has_many :items

##items テーブル
|goods|string|null: false|
|category|string|null: false|
|price|string|null: false|
|seller|string|null: false|

##Association
belongs_to :user
##addresses テーブル
|address|string|null: false, foreign_key: true |
|post|string|null: false|
|prefecture|string|null: false|
|municipalities|null: false|
|address|string|null: false|
|building_name|string|null: false|
|telephone_number|string|null: false|
|buyer|string|null: false, foreign_key: true |


##Association
has_one :orders
belongs_to :items
##ordersテーブル
|users|string|null: false, foreign_key: true |
|items|string|null: false, foreign_key: true |
##Association
has_one :user
belongs_to :orders