require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
     it "nicknameとlast_nameとfirst_name,last_name_kana,first_name_kana,birth_date,email,passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
     end
    end

   context '新規登録がうまくいかないとき' do
     it 'nicknameが空だと登録できない' do  
      @user.nickname = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'last_nameが空だと登録できない' do
      @user.last_name = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'birth_dateが空では登録できない' do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end
     it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailに＠が含まれないと登録できない' do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     
     it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")    
     end
     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが半角英数字混合でないと登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合を入力してください")    
     end
     it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）を入力してください")
     end
     it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）を入力してください")
     end
     it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを入力してください")
     end
     it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを入力してください")
     end
    end  
  end
end
