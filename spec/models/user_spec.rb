require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordは6文字以上であれば登録できる' do
          @user.password = '123asd'
          @user.password_confirmation = '123asd'
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailが一意性でなければ登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@が含まれないと登録できない' do
          @user.email = 'hogehuga.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordは半角英数混合でなければ登録できない(数字のみ)' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは半角英数混合でなければ登録できない(英字のみ)' do
          @user.password = 'asdfgh'
          @user.password_confirmation = 'asdfgh'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは半角でなければ登録できない' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end

    describe 'ユーザー新規登録本人確認情報' do
      context '新規登録できないとき' do
        it 'last_nameがなければ登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameがなければ登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.last_name = 'hoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'huge'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it 'last_name_kanaがなければ登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaがなければ登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
          @user.last_name_kana = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid')
        end
        it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
          @user.first_name_kana = 'ｱｱｱｱｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end
        it 'data_od_birthが空では登録できない' do
          @user.data_of_birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Data of birth can't be blank")
        end
      end
    end
  end
end
