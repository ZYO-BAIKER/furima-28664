class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                 null: false
      t.integer    :price,                null: false
      t.references :user,                 null: false,foreign_key: true
      t.integer    :category_id,          null: false
      t.integer    :condition_id,         null: false
      t.integer    :postage_payer_id,     null: false
      t.integer    :prefecture_seller_id, null: false
      t.integer    :send_date_id,         null: false
      t.text       :description,          null: false
      t.timestamps
    end
  end
end