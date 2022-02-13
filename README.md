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
has_one :order

##items テーブル
|goods|string|null: false|
|goods_explanation|text|null: false|
|category_id|integer|null: false|
|goods_situation_id|integer|null: false|
|delivery_charge_id|integer|null: false|
|shipment_source_id|integer|null: false|
|shipping_day_id|integer|null: false|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|

##Association
has_many :items
belongs_to :user
##addresses テーブル
|order|reference|null: false, foreign_key: true|
|post|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|null: false|
|address|string|null: false|
|building_name|string|
|telephone_number|string|null: false|
##Association
belongs_to :order
##ordersテーブル
|user|references|null: false, foreign_key: true |
|item|references|null: false, foreign_key: true |
##Association
belongs_to :item
belongs_to :user
has_one :address
