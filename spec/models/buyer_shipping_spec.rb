require 'rails_helper'

RSpec.describe BuyerShipping, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_shipping = FactoryBot.build(:buyer_shipping, user_id: user.id, item_id: item.id)
      sleep(1)
      
    end

  
      context '登録できるとき' do
        it '郵便番号、都道府県、市区町村、番地、電話番号、カード番号、有効期限、セキュリティコードがあれば登録できる' do
         expect(@buyer_shipping).to be_valid
        end  
 
        it '建物名がなくても登録できる' do
          @buyer_shipping.ship_to_address = ''
          expect(@buyer_shipping).to be_valid
        end  
      end  

      context '登録できないとき' do
        it '郵便番号が空では登録できない' do
          @buyer_shipping.postal_code = ''
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it '郵便番号は半角文字列でなければ登録できない' do
          @buyer_shipping.postal_code = '１１１−１１１１'
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it '郵便番号は3桁ハイフン4桁でなければ登録できない' do
          @buyer_shipping.postal_code = '12345678'
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it '都道府県が空では登録できない' do
          @buyer_shipping.area_id = 1
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Area must be other than 1")
        end
        
        it '市区町村がなければ登録できない' do
          @buyer_shipping.ship_city = ''
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Ship city can't be blank")
        end
        
        it '番地がなければ登録できない' do
          @buyer_shipping.ship_address = ''
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Ship address can't be blank")
        end
        
        it '電話番号がなければ登録できない' do
          @buyer_shipping.phone_number = ''
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        
        it '電話番号は半角数値でなければ登録できない' do
          @buyer_shipping.phone_number = '０８０１１１１１１１１'
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        
        it '電話番号は10桁以上11桁以内でなければ登録できない' do
          @buyer_shipping.phone_number = '0808888888888'
          @buyer_shipping.valid?
          expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
        end  
        
        #it 'カード番号がなければ登録できない' do
         # @buyer_shipping.card_number = ''
         # @buyer_shipping.valid?
         # expect(@buyer_shipping.errors.full_messages).to include("")
        #end
        
        #it '有効期限がなければ登録できない' do
         # @buyer_shipping.year = ''
         # @buyer_shipping.valid?
          #expect(@buyer_shipping.errors.full_messages).to include("")
        #end
        
        #it '有効期限がなければ登録できない' do
          #@buyer_shipping.month = ''
          #@buyer_shipping.valid?
          #expect(@buyer_shipping.errors.full_messages).to include("")
        #end

        #it 'セキュリティコードがなければ登録できない' do
          #it '有効期限がなければ登録できない' do
           # @buyer_shipping.cvc = ''
            #@buyer_shipping.valid?
            #expect(@buyer_shipping.errors.full_messages).to include("")
          #end
        #end  
      end      
  end  
end
