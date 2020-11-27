require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '情報を全て入力すれば保存できる' do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '画像が空だと出品できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が空だと出品できないこと' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空だと出品できないこと' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が空だと出品できないこと' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報が空だと出品できないこと' do
        @product.fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee can't be blank")
      end
      it '発送元の地域の情報が空だと出品できないこと' do
        @product.place_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Place can't be blank")
      end
      it '発送までの日数の情報が空だと出品できないこと' do
        @product.day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Day can't be blank")
      end
      it '価格の情報が空だと出品できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が￥300〜￥9,999,999の間でない場合出品できないこと' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が半角数字でない場合出品できないこと' do
        @product.price = '６６６'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
