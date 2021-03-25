require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      
      sleep 0.1
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end


    context 'できるとき' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context 'できないとき' do

      it '郵便番号は空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角のハイフンがないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村は空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      it '番地はは空だと保存できないこと' do
        @order_address.address_line = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end

      it '電話番号は空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内の数値のみではない場合は保存できないこと' do
        @order_address.phone_number = 111111111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
