require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー登録できる時' do
    it '正しい情報を入力すればユーザー新規登録できてトップページへ移動する' do
      #トップページへ移動する
      visit root_path
      #トップページに新規登録ボタンがある
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #正しくユーザー情報を入力する
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'Name', with: @user.name
      #登録するボタンを押すと、ユーザーモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #ログアウトボタンがある
      expect(page).to have_content('ログアウト')
      #ログインボタンや、新規登録ボタンは表示されていない
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ユーザー登録できない時' do
    it '誤った情報ではユーザー登録できず、新規登録ページへ戻ってくる' do
      #トップページへ移動
      visit root_path
      #新規登録ページへのボタンがある
      expect(page).to have_content('新規登録')
      #新規登録ページへ遷移する
      visit new_user_registration_path
      #ユーザー登録をする（誤った情報）
      fill_in 'Eメール', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード（確認用）', with: ''
      fill_in 'ニックネーム', with: ''
      fill_in 'Name', with: ''
      #ユーザーモデルのカウントは上がらない
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by (0)
      #新規登録ページへ戻っている
      expect(current_path).to eq('/users')
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'Eメール', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end