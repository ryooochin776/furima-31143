class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :perchases
  
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, confirmation: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze }
  validates :first_name, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze } 
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
  validates :birthday, presence: true

end