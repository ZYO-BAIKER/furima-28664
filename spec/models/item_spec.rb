require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全てのカラムが存在すれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが空では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it 'condtionが空では保存できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end
    it 'postage_payerが空では保存できないこと' do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer is not a number")
    end
    it 'prefecture_sellerが空では保存できないこと' do
      @item.prefecture_seller_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture seller is not a number")
    end
    it 'send_dateが空では保存できないこと' do
      @item.send_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Send date is not a number")
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数値でないと保存できないこと' do
      @item.price = "１あ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it 'priceが¥300~¥9,999,999の間でないと保存できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end