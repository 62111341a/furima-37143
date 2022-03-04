require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '' do
    context '内容に問題ない場合' do
      it 'すべて正しく入力された時' do
      
      expect(@item).to be_valid
      end
    end
    context'内容に問題がある場合' do
  
      it '商品画像が空なら登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品が空なら登録出来ない' do
        @item.goods = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods can't be blank")
      end
      it '商品説明が空なら登録出来ない' do
        @item.goods_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods explanation can't be blank")
      end
      
      it 'カテゴリーが空なら登録出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他が空なら登録出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品情報が空なら登録出来ない' do
        @item.goods_situation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods situation can't be blank")
      end
      it '---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪いが空なら登録出来ない' do
        @item.goods_situation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods situation can't be blank")
      end
      it '---、着払い(購入者負担)、送料込み(出品者負担)が空なら登録出来ない' do
        @item.delivery_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '配送料が空なら登録出来ない' do
        @item.delivery_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元が空なら登録出来ない' do
        @item.shipping_source = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping source can't be blank")
      end
      it '「---」と47都道府県の合計48項目が表示されないなら登録出来ない' do
        @item.shipping_source = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping source can't be blank")
      end
      it '発送日数が空なら登録出来ない' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '---、1~2日で発送、2~3日で発送、4~7日で発送が空なら登録出来ない' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空なら登録出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = 3
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item.price = 9,999,999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      
    end
  end
end
  

