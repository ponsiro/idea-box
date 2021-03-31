require 'rails_helper'

RSpec.describe Idea, type: :model do
  before do 
    @idea = FactoryBot.build(:idea)
  end

  describe 'アイディア投稿' do
    context 'アイディア投稿できる時' do
      it 'contentとimageがあれば投稿できる' do
        expect(@idea).to be_valid
      end
      it 'contentが空でも投稿できる' do
        @idea.content = ''
        expect(@idea).to be_valid
      end
      it 'imageがなくても投稿できること' do
        @idea.image = nil
        expect(@idea).to be_valid
      end
    end

    context 'アイディア投稿できない時' do
      it 'contentとimageがなければ投稿できないこと' do
        @idea.content = ''
        @idea.image = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include "テキストまたは画像を入力してください"
      end

      it 'userが紐づいていないと投稿できないこと' do
        @idea.user = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
