class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, :city, :house_number, :phone_number, :token, :user_id, :item_id
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にハイフン（-）を入れて下さい' } # 「住所」の郵便番号に関するバリデーション
  validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'を正しく入力して下さい（ハイフン不要）' } # 「住所」の電話番号に関するバリデーション

  validates :prefecture_id, numericality: { other_than: 1, message: "を選んで下さい" } # 「住所」の都道府県に関するバリデーション

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
