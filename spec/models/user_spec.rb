require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します  
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが英字だけでは登録できないこと' do
      @user.password = 'fdghjh'
      @user.password_confirmation = 'fdghjh'
  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
      it 'passwordが全角文字では登録できないこと'  do
      @user.password = 'あああああああ'
      @user.password_confirmation = 'あああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が半角英字では登録できないこと' do
      @user.surname = 'fdghjh'
    
  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前が半角英字では登録できないこと' do
      @user.name = 'fdghjh'
  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前(カナ)が全角日本語では登録できないこと' do
      @user.surname = '隆太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字(カナ)が全角日本語では登録できないこと' do
      @user.furigana_surname = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
end
