FactoryBot.define do
  factory :item_order do
    post{"123-4567"}
    shipping_source_id{"6"}
    municipalities{"横浜市"}
    address{"11"}
    telephone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
