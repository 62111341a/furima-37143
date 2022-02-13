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
belong_to :users

##items テーブル
|goods_id|string|null: false|
|goods_explanation_id|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|goods_situation_id|integer|null: false|
|delivery_charge_id|integer|null: false|
|shipment_source_id|integer|null: false|
|shipping_days_id|integer|null: false|
|price|integer|null: false|
|seller|string|null: false, foreign_key: true|

##Association
belongs_to :item
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
has_one :order
##ordersテーブル
|user|references|null: false, foreign_key: true |
|item|references|null: false, foreign_key: true |
##Association
has_one :item
belong_to :item
belongs_to :user
has_one :address
