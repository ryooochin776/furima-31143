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
      it '商品名が空だと出品できないこと' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと出品できないこと' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーのidが1では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態のidが1では登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status must be other than 1')
      end

      it '配送料のidが1では登録できない' do
        @product.fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee must be other than 1')
      end

      it '発送元の地域のidが1では登録できない' do
        @product.place_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Place must be other than 1')
      end

      it '発送までの日数のidが1では登録できない' do
        @product.day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Day must be other than 1')
      end
      it '価格の情報が空だと出品できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が¥299以下の場合出品できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥10,000,000以上の場合出品できないこと' do
        @product.price = 10, 0o00, 0o00
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
      it '価格が半角数字でない場合出品できないこと' do
        @product.price = '６６６'
        @product.valid?
        expect(@product.errors.full_messages).to include('')
      end
    end
  end
end
