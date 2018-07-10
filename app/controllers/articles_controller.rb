class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    Article.create(title: params[:title], text: params[:text],user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end
end
