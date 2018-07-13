class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
    redirect_to action: :index
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
    redirect_to action: :index
  end


  private
  def article_params
    params.permit(:title, :text)
  end

  private
  def create_params
    params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
  end
end
