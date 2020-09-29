require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '新規登録がうまくいくとき' do
      it '空欄なく入力すれば登録できる' do
        @item.image = fixture_file_upload("spec/fixtures/test_image.jpg")
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '画像がないと登録できない' do
        @item.image = nil
        
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がない登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がないと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '発送元の地域についての情報がないと登録できない' do
        @item.address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end
      it '価格についての情報がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥~299だと登録できない' do
        num = 0
        299.times do |num|
          @item.price = num
        end
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、¥~299だと登録できない' do
        num = 0
        299.times do |num|
          @item.price = num
        end
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、¥10,000,000だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は全角数字は登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英字は登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリが--だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
      end    
        it '商品の状態が--だと登録できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送予定日が--だと登録できない' do
          @item.estimate_of_deliver_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Estimate of deliver must be other than 1")
      end
    end
  end
end
