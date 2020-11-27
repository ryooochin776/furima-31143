class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :place
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :place_id
    validates :day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }
  end

  with_options numericality: { other_than:1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :place_id
    validates :day_id
  end
end
