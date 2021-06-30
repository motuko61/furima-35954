require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品登録できるとき' do
        it '商品画像、商品名、商品の説明、カテゴリーの情報、商品の状態の情報、配送料負担の情報、発送元の地域の情報、発送までの日数の情報、価格の情報があれば登録できる' do
          expect(@item).to be_valid
        end
        it '価格は半角数値であれば登録できる' do
          @item.price = 400
          expect(@item).to be_valid
        end
      end
      context '商品出品登録できないとき' do
        it '商品画像がなければ登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名がなければ登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明がなければ登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーの情報がなければ登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態の情報がなければ登録できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
        it '配送料の負担の情報がなければ登録できない' do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Charge must be other than 1')
        end
        it '発送元の地域の情報がなければ登録できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it '発送までの日数の情報がなければ登録できない' do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
        end
        it '価格の情報がなければ登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid', 'Price is invalid', 'Price is not a number')
        end
        it '価格は半角数値でなければ登録できない' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格は300より大きくないと保存できない' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '価格は9999999より小さくないと保存できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end
