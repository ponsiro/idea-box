require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる時' do
      it 'nameとnicknameとemailとpasswordとpassword_confirmationが存在すると登録できる' do 
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nameを入力してください"
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが5文字以下なら登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'emailが同じなら登録できないだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it 'nicknameが20文字以上だと登録できない' do
        @user.nickname = 'a' * 21
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームは20文字以内で入力してください"
      end
      it 'profileは300文字以内じゃないと登録できない' do
        @user.profile = "a" * 301
        @user.valid?
        expect(@user.errors.full_messages).to include "Profileは300文字以内で入力してください"
      end
    end
  end
end
