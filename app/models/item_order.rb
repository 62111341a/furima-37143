class ItemOrder
    include ActiveModel::Model
    attr_accessor   :token, :item_id, :post, :municipalities, :address, :building_name, :telephone_number, :user_id, :shipping_source_id
  with_options presence: true do
          validates :municipalities, presence: true
          validates :address, presence: true
          validates :user_id, presence: true
          validates :item_id, presence: true
          validates :token, presence: true
          validates :telephone_number, presence: true
          validates :post, format: { with: /\A\d{3}[-]\d{4}\z/}
          validates :telephone_number, format: { with: /\A\d{10,11}\z/}
  end
      validates :shipping_source_id, numericality: {other_than: 1, message: "can't be blank"}
  def save
      order = Order.create(item_id: item_id, user_id: user_id)   
     Address.create(telephone_number: telephone_number,post: post, shipping_source_id: shipping_source_id, municipalities: municipalities, address: address, order_id: order.id,)
  end
end