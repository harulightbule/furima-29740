require 'rails_helper'

RSpec.describe ItemUserAddress, type: :model do
  describe '購入管理情報の保存' do
    before do
      @item_user_address = FactoryBot.build(:item_user_address)
    end

    context '商品購入が上手くいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_user_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @item_user_address.building_name = nil
      expect(@item_user_address).to be_valid
    end
  end

   context '商品購入が上手くいかないとき' do
    it 'postal_codeが空だと保存できないこと' do
      @item_user_address.postal_code = nil
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_user_address.postal_code = '1234567'
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @item_user_address.prefecture = 0
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できないこと' do
      @item_user_address.city = nil
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @item_user_address.house_number = nil
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberは空だと保存できないこと' do
      @item_user_address.phone_number = nil
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角ハイフンを含まず11桁以内でないと保存できないこと' do
      @item_user_address.phone_number = '090-1234-56789'
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空だと保存できないこと' do
      @item_user_address.token = nil
      @item_user_address.valid?
      expect(@item_user_address.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end