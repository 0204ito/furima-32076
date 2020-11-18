require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', last_name: 'abc', first_name: 'def', last_name_kana: 'ghi', first_name_kana: 'jkl', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'last_nameが空だと登録できない' do
      user = User.new(nickname: 'abc', last_name: '', first_name: 'def', last_name_kana: 'ghi', first_name_kana: 'jkl', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: '', last_name_kana: 'ghi', first_name_kana: 'jkl', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: '', first_name_kana: 'jkl', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: 'jkl', first_name_kana: '', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: 'jkl', first_name_kana: 'mno', birth_date: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: 'jkl', first_name_kana: 'mno', birth_date: 123, email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: 'jkl', first_name_kana: 'mno', birth_date: 123, email: 'kkk@gmail.com', password: '', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      user = User.new(nickname: 'abc', last_name: 'def', first_name: 'ghi', last_name_kana: 'jkl', first_name_kana: 'mno', birth_date: 123, email: 'kkk@gmail.com', password: '00000000', password_confirmation: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
