require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do

    context 'できるとき' do
      it '全ての項目が存在すればできる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end

      it 'family_nameが全角であれば登録できる' do
        @user.nickname = 'ぜんかく'
        expect(@user).to be_valid
      end

      it 'first_nameが全角であれば登録できる' do
        @user.nickname = 'ぜんかく'
        expect(@user).to be_valid
      end

      it 'family_name_kanaが全角カタカナであれば登録できる' do
        @user.nickname = 'ゼンカクカナ'
        expect(@user).to be_valid
      end

      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.nickname = 'ゼンカクカナ'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
    end

    context 'できないとき' do
      it 'nicknameがない場合は登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailがない場合は登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "emailに@がない場合は登録できないこと " do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'passwordがない場合は登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'password_confirmationがない場合は登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが6文字以下であれば登録できないこと' do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameがない場合は登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'first_nameがない場合は登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'family_name_kanaがない場合は登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end

      it 'first_name_kanaがない場合は登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'birthdayがない場合は登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'family_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end

      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = "１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = "ａａａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = "あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      
    end
  end
end
