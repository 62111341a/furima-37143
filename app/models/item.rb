class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :user

  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :goods_situation
  belongs_to :shipping_day
  belongs_to :shipping_source
  validates :goods, presence: true
  validates :category_id, presence: true
  validates :goods_situation_id, presence: true
  validates :goods_explanation, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shipping_source_id, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :goods_situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_source_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
end
