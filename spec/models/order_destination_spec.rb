require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入者情報の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

      it '全ての項目が入力されていれば購入ができる' do
        expect(@order_destination).to be_valid
      end

      it 'token(クレジットカード情報)が空だと購入ができない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入ができない' do
        @order_destination.post_code = ""
        @order_destination.valid?
        expect(@order_destination.errors.messages).to include(:post_code => ["can't be blank", "is invalid. Include hyphen(-)"])
      end

      it '郵便番号にハイフンがないと登録できない' do
        @order_destination.post_code = "12345678"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '郵便番号が8桁でないと購入できない' do
        @order_destination.post_code = "123-458"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが空だと購入できない' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入できない' do
        @order_destination.house_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_destination.phone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが11桁でなければ購入できない' do
        @order_destination.phone_number = "080123456789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

  end
end
