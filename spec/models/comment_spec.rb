require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do 
    @comment = FactoryBot.build(:comment)
  end

  describe 'comment投稿' do
    context 'commentを投稿できる' do
      it 'textがあれば投稿できること' do
        expect(@comment).to be_valid
      end
    end
  
    context 'commentを投稿できない' do
      it 'textが空なら投稿できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Textを入力してください"
      end
      it 'userが紐づいていないと投稿できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Userを入力してください"
      end
      it 'ideaが紐づいていないと投稿できないこと' do 
        @comment.idea = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Ideaを入力してください"
      end
      it 'commentが201文字より多いと登録できないこと' do
        @comment.text = 'a' * 201
        @comment.valid?
        binding.pry
        expect(@comment.errors.full_messages).to include "Textは200文字以内で入力してください"
      end
    end
  end
end
