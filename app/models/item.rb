class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :comments, dependent: :destroy # この記載により、商品が削除された場合、紐づくコメントも連動して削除される

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_seller
  belongs_to_active_hash :send_date

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates_inclusion_of :price, in: 300..9_999_999

  with_options presence: true do
    validates :image, :name, :description, :price
  end

  with_options numericality: { other_than: 1 } do
    validates :send_date_id, :prefecture_seller_id, :postage_payer_id, :condition_id, :category_id
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
