require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    # it '画像は1枚必須であること' do
    #   @product.photo = nil
    #   @product.valid?
    #   expect(@product.errors.full_messages).to include("Photo can't be blank")
    # end
    it '商品名が必須であること' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @product.explanation = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @product.condition = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @product.postage_type = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Postage type can't be blank")
    end
    it '発送元の地域についての情報が必須であること' do
      @product.prefecture = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @product.preparation_days = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Preparation days can't be blank")
    end
    it '価格についての情報が必須であること' do
      @product.value = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Value can't be blank")
    end
    it '価格の範囲が、¥300~であること' do
      @product.value = '200'
      @product.valid?
      expect(@product.errors.full_messages).to include('Value must be greater than 300')
    end
    it '価格の範囲が~¥9,999,999であること' do
      @product.value = '10000000'
      @product.valid?
      expect(@product.errors.full_messages).to include('Value must be less than 9999999')
    end
    it '販売価格は半角数字のみ入力可能であること' do
      @product.value = '５０００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Value is not a number')
    end
  end
end
