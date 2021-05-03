class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit,:destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
  end

  def update
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

  def set_article
    @article = Article.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @article.user
  end

end
