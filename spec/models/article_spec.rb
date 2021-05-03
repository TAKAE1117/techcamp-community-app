require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿機能' do
    context '記事が投稿できる時' do
      it 'titleとgenre_idとtextがあれば投稿できる' do
        expect(@article).to be_valid
      end

      it 'genre_idが0以外であれば投稿できる' do
        @article.genre_id != 0
        expect(@article).to be_valid
      end
    end

    context '記事が投稿できないとき' do
      it 'titleが空の場合、投稿できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'genre_idが空の場合、投稿できない' do
        @article.genre_id = ''
        @article.valid?
        # expect(@article.errors.full_messages).to include("Genre_id can't be blank")
      end

      it 'genre_idが0の場合、投稿できない' do
        @article.genre_id = 0
        @article.valid?
      end

      it 'textが空の場合、投稿できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Text can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('User must exist')
      end
    end
  end
end
