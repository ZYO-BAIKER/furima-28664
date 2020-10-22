class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  validates :image, :name, :description, presence: true
  validates :price, presence: true, format: { with: /\A[a-z0-9]+\z/i }

  validates :send_date_id, :prefecture_seller_id, :postage_payer_id, :condition_id, :category_id,  numericality: { other_than: 1 }
  
  end
end
