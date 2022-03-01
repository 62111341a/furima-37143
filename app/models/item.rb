class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates :title, :text, presence: true
    validates :item_id, numericality: { other_than: 1 , message: "can't be blank" }
end
