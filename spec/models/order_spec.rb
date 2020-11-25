require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user) # ユーザーを一つ作成（組織一つも自動に生成）
    @item = FactoryBot.create(:item) # アイテムを一つ作成（組織一つも自動に生成）
    @user2 = FactoryBot.create(:user) # ユーザー２を一つ作成（組織一つも自動に生成）
    @order = FactoryBot.build(:order, user_id: @user2.id, item_id: @item.id)
    sleep 1 # Rspecの処理スピードを遅くする（Msqlのスピードより早くなってMsqlにエラーが出ることがマレにある）
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
      it 'phoneは11桁以内でも保存できる' do
        @order.phone = '1234'
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが１では保存できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityは空では保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空では保存できない' do
        @order.house_number = ' '
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneはハイフンがあると保存できないこと' do
        @order.phone = '123-4567-8901'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
