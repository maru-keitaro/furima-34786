require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end
 
  describe '出品登録' do

    context 'できないとき' do

      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名がないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品説明がないと登録ができない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーがないと登録ができない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end

      it '商品状態がないと登録ができない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition is not a number"
      end

      it '配送料の負担がないと登録できない' do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee is not a number"
      end

      it '発送元の地域がなければ登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end

      it '発送までの日数がなければ登録できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day is not a number"
      end

      it '価格がなければ登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300より小さかった場合出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格が9999999より大きかった場合出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

    end
  end
end