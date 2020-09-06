require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_info)
    end

    it '郵便番号が必須であること' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が必須であること' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須であること' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が必須であること' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号にはハイフンが必要であること' do
      @order.postal_code = '0000000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @order.phone_number = '000-0000-0000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it '郵便番号は3桁-4桁であること' do
      @order.postal_code = '0000-000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end
  end
end
