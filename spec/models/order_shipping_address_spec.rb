require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての入力項目が揃っていれば購入できる' do
        expect(@order_shipping_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは半角数字でないと購入できない' do
        @order_shipping_address.postal_code = '１２３-４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code should be in the format of '3 digits - 4 digits'")
      end
      it 'postal_codeは-(ハイフン)を含まないと登録できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code should be in the format of '3 digits - 4 digits'")
      end
      it 'prefectureが初期値では購入できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは-(ハイフン)を含むと登録できない' do
        @order_shipping_address.phone_number = '111-1111-1111'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end
      it 'phone_numberは9桁以下では登録できない' do
        @order_shipping_address.phone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end
      it 'phone_numberは12桁以上では登録できない' do
        @order_shipping_address.phone_number = '000123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end
      it 'user_idが空では購入できない' do
        @order_shipping_address.user_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_shipping_address.item_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end