require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe 'クレジットカード情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
      # expect(@user).to be_valid 有効です
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      @user_order.building = ""
      expect(@user_order).to be_valid

      # expect(@user).to be_valid 有効です
    end
    it '郵便番号が空だと保存できないこと' do
      @user_order.postcode = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postcode can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @user_order.address_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank", "Address can't be blank")
    end
    it '市町村が空だと保存できないこと' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it '電話番号が空だと保存できないこと' do
      @user_order.phonenumber = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phonenumber can't be blank")
    end
    it '郵便番号にーを入れないと保存できない' do
      @user_order.postcode = '00000000'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it "トークンがないと保存できない" do
      @user_order.token = ""
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it "電話番号は-を入れると保存できない" do
      @user_order.phonenumber = "000-000-000"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phonenumber is invalid. Include hyphen(-)")
    end
    it "電話番号は11桁以上だと保存できない" do
      @user_order.phonenumber = "000000000000"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phonenumber is invalid. Include hyphen(-)")
    end
    it "都道府県は0の時保存できない" do
      @user_order.address_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end
  end
end
