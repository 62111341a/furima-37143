require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:item)
  end
  describe '' do
    context '内容に問題ない場合' do
      it 'すべて正しく入力された時' do
      expect(@item).to be_valid
      end
    end

    context'内容に問題がある場合' do

