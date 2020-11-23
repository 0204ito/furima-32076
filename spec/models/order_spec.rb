require 'rails_helper'

RSpec.describe Order, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品購入機能' do
     context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
      end
     end
    
     context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと保存できない' do

      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do

      end
      it 'prefectureが１では保存できない' do
      end
      it 'cityは空でも保存できること' do
      end
      it 'house_numberは空でも保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end
     end
    end
end
