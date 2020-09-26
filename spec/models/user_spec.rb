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
        expect(@user).to be_valid
      end
    end
    
    

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      

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
      it 'パスワードは英数字混合ではないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'firstnameは空白だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is invalid")
      end
      it 'surnameは空白だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname is invalid")
      end

      it 'firstname_kanaは空白だと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank", "Firstname kana is invalid")
        
      
      end
      it 'surname_kanaは空白だと登録できない' do
        
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana is invalid")
      
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'firstnameが漢字、かな、カナでなければ登録できない' do
        @user.firstname = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it 'surnameが漢字、かな、カナでなければ登録できない' do
        @user.surname = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end
      it 'firstname_kanaがカナでなければ登録できない' do
        @user.firstname_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it 'firstname_kanaが漢字では登録できない' do 
        @user.firstname_kana = "仮名"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it 'surname_kanaがカナでなければ登録できない' do
        @user.surname_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana is invalid")
      end  
      it 'surname_kanaがカナでなければ登録できない' do
        @user.surname_kana = "仮名"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana is invalid")
      end
    end
  end
end


# 勉強用のためのコメントアウト
# メモ用、単体テストコードで最低限必要なもの
# 1.gemfileの記述
# 2.specのインストール
# 3.単体テストなので、対象モデルのデータが抽出できるか確認するため、spec→モデルの中にファイルを作成し、記述
# 4.bundle exec rspec spec/models/user_spec.rbで出力
# あると便利なもの
# 5.頻出の値をまとめておくのがfactorybot

# 気付き
# 英数字混合として代入してみたがダメでした。"aa000"としました
# @user.password_confirmation =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
# https://gist.github.com/nashirox/38323d5b51063ede1d41


