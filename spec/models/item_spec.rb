require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end
 
  describe '出品登録' do

    context 'できるとき' do
      it '全ての項目があれば登録できる' do
        expect(@item).to be_valid
      end
    end

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

      it '商品価格が半角英数字混合では出品できない' do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '商品価格が半角英字のみでは出品できない' do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '商品価格が全角文字では出品できない' do
        @item.price = "あいうえお"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'userが紐付いていない場合は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it 'カテゴリーに0が選択されている場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end

      it '商品の状態に0が選択されている場合は出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 0"
      end

      it '配送料の負担に0が選択されている場合は出品できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
      end

      it '発送元の地域に0が選択されている場合は出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it '発想までの日数に0が選択されている場合は出品できない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day must be other than 0"
      end

    end
  end
end