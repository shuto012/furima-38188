require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_address.item_id = 3
        expect(@order_address).to be_valid
      end
      it 'post_codeが「3桁ハイフン4桁」の組み合わせであれば保存できる' do
        @order_address.post_code = '123-4560'
        expect(@order_address).to be_valid
      end
      it 'prefecture_idが1以外かつ空でなければ保存できる' do
        @order_address.prefecture_id = 2
        expect(@order_address).to be_valid
      end
      it 'municipalityが空でなければ保存できる' do
        @order_address.municipality = 'あいうえお市'
        expect(@order_address).to be_valid
      end
      it 'addressが空でなければ保存できる' do
        @order_address.address = 'かきくけこ'
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
      it 'phone_numberが10桁以上11桁以内の半角文字列のみ保存できる' do
        @order_address.phone_number = 12345678912
        expect(@order_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと保存できないこと' do
        @order_address.post_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @order_address.phone_number = '123-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上あると保存できないこと' do
        @order_address.phone_number = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下あると保存できないこと' do
        @order_address.phone_number = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end