require 'rails_helper'

RSpec.describe "Ideas", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @idea_content = Faker::Lorem.sentence
    @idea_image = Faker::Lorem.sentence
  end
  context 'idea投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # フォームに情報を入力する
      fill_in 'idea_content', with: @idea_content
      # 送信するとIdeaモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit_content"]').click
      }.to change {Idea.count}.by(1)
      # トップページにいることを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content(@idea_content)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿フォームがない' do
      # トップページに遷移する
      visit root_path
      # 投稿フォームがない
      expect(page).to have_no_content("投稿する")
    end
  end
end

RSpec.describe 'アイディア編集', type: :system do
  before do
    @idea1 = FactoryBot.create(:idea)
    @idea2 = FactoryBot.create(:idea)
  end
  context 'アイディア編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したアイディアの編集ができる' do
      # アイディア1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @idea1.user.email
      fill_in 'パスワード', with: @idea1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # アイディア1詳細ページへ遷移する
      visit idea_path(@idea1)
      # アイディア1編集ボタンをクリックする
      click_link nil, href: edit_idea_path(@idea1)
      # アイディア1編集ページにいることを確認する
      expect(current_path).to eq(edit_idea_path(@idea1))
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(page).to have_content(@idea1.content)
      # 投稿内容を編集する
      fill_in 'idea[content]', with: "#{@idea1.content}+新しい投稿"
      # 編集してもIdeaモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Idea.count}.by (0)
      # アイディア詳細ページへ遷移したことを確認する
      expect(current_path).to eq(idea_path(@idea1))
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content("#{@idea1.content}+新しい投稿")
    end
  end
  context 'アイディア編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
  #     アイディア1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @idea1.user.email
      fill_in 'パスワード', with: @idea1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
  #     アイディア2をクリックし、アイディア2の詳細画面に遷移する
      visit idea_path(@idea2)
  #     アイディア2に「編集」ボタンがないことを確認する
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
  #     トップページにいる
  #     アイディア1に「編集」ボタンがないことを確認する
  #     アイディア2に「編集」ボタンがないことを確認する
    end
  end
end
