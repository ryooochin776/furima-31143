class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :perchases

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
    validates :birthday
  end
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, confirmation: true
end
