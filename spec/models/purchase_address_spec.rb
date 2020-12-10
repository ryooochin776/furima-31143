require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      product = FactoryBot.build(:product, user_id: user1.id)
      product.save
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user2.id, product_id: product.id)
      sleep(1)
    end
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空では保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがなければ保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県を選択していないと保存できないこと' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空では保存できないこと' do
      @purchase_address.municipality = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では保存できないこと' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあれば保存できないこと' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が11桁より多きければ保存できないこと' do
      @purchase_address.phone_number = '090111122222'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '建物名は空でも保存できること' do
      @purchase_address.building = nil
      expect(@purchase_address).to be_valid
    end
    it 'tokenが空では保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it '都道府県のidが0では保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
    end
    it 'user_idが空では保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'product_idが空では保存できないこと' do
      @purchase_address.product_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Product is not a number")
    end
  end
end
