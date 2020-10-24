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
    it 'categoryがid_1では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'condtionがid_1では保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it 'postage_payerがid_1では保存できないこと' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
    end
    it 'prefecture_sellerがid_1では保存できないこと' do
      @item.prefecture_seller_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture seller must be other than 1')
    end
    it 'send_dateがid_1では保存できないこと' do
      @item.send_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Send date must be other than 1')
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数値でないと保存できないこと' do
      @item.price = '１あ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it 'priceが上限の10000000以上では保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end