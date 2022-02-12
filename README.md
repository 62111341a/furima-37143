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
has_many :orders

##items テーブル
|image_id|integer|null: false, foreign_key: true|
|goods_id|integer|null: false, foreign_key: true|
|goods_explanation_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|goods_situation_id|integer|null: false, foreign_key: true|
|delivery_charge_id|integer|null: false, foreign_key: true|
|shipment_source_id|integer|null: false, foreign_key: true|
|shipping_days_id|integer|null: false, foreign_key: true|
|price|integer|null: false, foreign_key: true|
|seller|string|null: false, foreign_key: true|

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
##ordersテーブル
|user|references|null: false, foreign_key: true |
|item|references|null: false, foreign_key: true |
##Association
has_one :item
belongs_to :users
has_one :addresses
belong_to :orders
