FactoryBot.define do
  factory :item do
    association :user
    category_id { 3 }
    delivery_charge_id { 3 }
    goods_explanation { 'rr' }
    goods_situation_id { 2 }
    goods { 'yy' }
    shipping_day_id { 3 }
    shipping_source_id { 4 }
    price { 666 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
