class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :genre_id, :text).merge(user_id: current_user.id)
  end
end
