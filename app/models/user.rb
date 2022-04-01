class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  validates :surname, presence: true
  validates :name, presence: true
  validates :furigana_surname, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :furigana_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }

  validates :date_of_birth, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数字混合' }
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  has_many :orders
  has_many :items
end
