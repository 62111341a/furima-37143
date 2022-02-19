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
         has_many :items
         
        end
   
      
