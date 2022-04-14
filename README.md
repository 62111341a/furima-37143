## usersテーブル

|Column|Type|Options|
| ------ | ----- | ------- |
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
has_many :orders


##items テーブル
|Column|Type|Options|
| ------ | ----- | ------- |
|goods|string|null: false|
|goods_explanation|text|null: false|
|category_id|integer|null: false|
|goods_situation_id|integer|null: false|
|delivery_charge_id|integer|null: false|
|shipping_source_id|integer|null: false|
|shipping_day_id|integer|null: false|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|

##Association
has_one :order
belong_to :user

##addresses テーブル
|Column|Type|Options|
| ------ | ----- | ------- |
|order|reference|null: false, foreign_key: true|
|post|string|null: false|
|shipping_source|integer|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building_name|string|
|telephone_number|string|null: false|

##Association
belongs_to :order

##ordersテーブル
|Column|Type|Options|
| -- | -------- | ----------------------------- |
|user|references|null: false, foreign_key: true |
|item|references|null: false, foreign_key: true |

##Association
belongs_to :item
belongs_to :user
has_one :address
