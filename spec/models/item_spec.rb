require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品を登録' do
    before do
      @items = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@items).to be_valid
    end
    it 'imageを選択しなければ保存できない' do
      @items.image = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと保存できないこと' do
      @items.name = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Name can't be blank")
    end
    it 'explanationが空だと保存できないこと' do
      @items.explanation = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'category_idを選択していないと保存できないこと' do
      @items.category_id = 1
      @items.valid?
      expect(@items.errors.full_messages).to include('Category must be other than 1')
    end
    it 'status_idを選択していないと保存できないこと' do
      @items.status_id = 1
      @items.valid?
      expect(@items.errors.full_messages).to include('Status must be other than 1')
    end
    it 'delivery_fee_idを選択していないと保存できないこと' do
      @items.delivery_fee_id = 1
      @items.valid?
      expect(@items.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it 'area_idを選択していないと保存できないこと' do
      @items.area_id = 0
      @items.valid?
      expect(@items.errors.full_messages).to include('Area must be other than 0')
    end
    it 'day_idが空だと保存できないこと' do
      @items.day_id = 1
      @items.valid?
      expect(@items.errors.full_messages).to include('Day must be other than 1')
    end
    it 'priceが空だと保存できないこと' do
      @items.price = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円未満では保存できないこと' do
      @items.price = 299
      @items.valid?
      expect(@items.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @items.price = 10_000_000
      @items.valid?
      expect(@items.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが全角数字だと保存できないこと' do
      @items.price = '２０００'
      @items.valid?
      expect(@items.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
