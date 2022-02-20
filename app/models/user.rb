class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :email, presence: true
         validates :encrypted_password, presence: true
         validates :surname, presence: true
         validates :name, presence: true
         validates :furigana_surname, presence: true
         validates :furigana_name, presence: true
         validates :date_of_birth, presence: true
         validates :password, presence: true
         validates :password, format: { with: /\A[a-z0-9]+\z/ , message: '英数字混合'}
         with_options presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角文字を使用してください' } do
          validates :surname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
          validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }

         #has_many :items
         
        end
      end

   
      
