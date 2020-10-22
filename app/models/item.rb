class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_seller_id, presence: true
  validates :send_date_id, presence: true
  validates :description, presence: true
  
  end
end
