class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :conditoin
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_seller
  belongs_to_active_hash :send_date


  validates :image, :name, :description, :price, presence: true

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates_inclusion_of :price, in: 300..9999999

  validates :send_date_id, :prefecture_seller_id, :postage_payer_id, :condition_id, :category_id,  numericality: { other_than: 1 }
  
end