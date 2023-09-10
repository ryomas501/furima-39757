require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do

  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_buyer = FactoryBot.build(:purchase_buyer , user_id: user.id, item_id: item.id)
    end
    context '商品購入できるとき' do
      it '全項目の入力が存在すれば登録できる' do
        expect(@purchase_buyer).to be_valid
      end
      it '建物名が未入力でも登録できる' do
        @purchase_buyer.building_name = ''
        expect(@purchase_buyer).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'クレジットカード情報が正しく入力できていないと登録できない' do
        @purchase_buyer.token = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeがない場合は登録できない' do
        @purchase_buyer.post_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがない場合は登録できない' do
        @purchase_buyer.post_code = '1111111'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code is invalid.")
      end
      it 'post_codeが全角数字では登録できない' do
        @purchase_buyer.post_code = '１１１-１１１１'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code is invalid.")
      end
      it 'placeが未選択では登録できない' do
        @purchase_buyer.place_id = 1
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Place can't be blank")
      end
      it 'cityがない場合は登録できない' do
        @purchase_buyer.city = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberがない場合は登録できない' do
        @purchase_buyer.house_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberがない場合は登録できない' do
        @purchase_buyer.phone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満の場合は登録できない' do
        @purchase_buyer.phone_number = '123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが全角数字の場合は登録できない' do
        @purchase_buyer.phone_number = '１２３４５６７８９０'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが12桁以上の場合は登録できない' do
        @purchase_buyer.phone_number = '123456789012345'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_buyer.user_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_buyer.item_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
