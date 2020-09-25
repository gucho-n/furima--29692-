# rails g rspec:model userを記述して作成,Factorybotってどこを見ているのかな？

require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    # factories(user)から引っ張ってきています
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email、password,password_confirmation,name(カナも),birthdayが存在すれば登録できる' do
        expect(@user).to be_valid

        # expect(@user).to be_valid 有効です
      end
      it 'nicknameが6文字以下で登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        # @user.password_confirmation =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      # そもそもバリデーションしてるからいらない
      # it "nicknameが7文字以上であれば登録できない" do
      #   @user.nickname = "aaaaaaa"
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include([])
      # end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'Emailアドレスは＠がないと登録できない' do
        @user.email = 'aaaaaaaaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end

# マストなもの
# 1.gemfileの記述
# 2.specのインストール
# 3.単体テストなので、対象モデルのデータが抽出できるか確認するため、spec→モデルの中にファイルを作成し、記述
# 4.bundle exec rspec spec/models/user_spec.rbで出力
# あると便利なもの
# 5.頻出の値をまとめておくのがfactorybot

# rails g rspec:model userを記述して作成,Factorybotってどこを見ているのかな？

# require 'rails_helper'
# RSpec.describe User, type: :model do
#   describe 'ユーザー新規登録' do
#     it "nicknameが空だと登録できない" do
#       user = FactoryBot.build(:user)
#       user.nickname = ""  # nicknameの値を空にする
#       user.valid?
#       expect(user.errors.full_messages).to include("Nickname can't be blank")
#     end
