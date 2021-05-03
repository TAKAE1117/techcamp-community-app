require 'rails_helper'
describe ArticlesController, type: :request do

  before do
    @article = FactoryBot.create(:article)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のtitleが存在する' do 
      get root_path
      expect(response.body).to include(@article.title)
    end

    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のtextが存在する' do 
      get root_path
      expect(response.body).to include(@article.text)
    end

    it 'indexアクションにリクエストするとユーザーが投稿したnicknameが存在する' do
      get root_path
      expect(response.body).to include(@article.user.nickname)
    end

  end

end