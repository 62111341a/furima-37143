require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order,user_id: user.id, item_id: item.id)
  end
  context '内容に問題ない場合' do
    it "正しく情報が入力されている場合" do
      expect(@item_order).to be_valid
    end
    it "番地が空でも登録できること" do
      expect(@item_order).to be_valid
    end
  end
    context '内容に問題がある場合' do
      it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ保存できないこと' do
        @item_order.post= '1234-5678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post is invalid")
      end
      it '郵便番号が空だと保存できないこと' do
        @item_order.post = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @item_order.shipping_source_id = 0
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipping source can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @item_order.address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @item_order.municipalities = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @item_order.telephone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は、-なしの10桁以上11桁以内の半角数値でなければ保存できないこと' do
        @item_order.telephone_number= '090123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が全角数字だと保存できないこと' do
        @item_order.telephone_number = '０９０１２３４５６７８'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が10桁未満では保存できないこと' do
        @item_order.telephone_number = "3"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が１１桁を超えると出品できないこと' do
        @item_order.telephone_number = "0901234567890"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
     end
  end