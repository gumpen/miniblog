class CommentsController < ApplicationController
    def create
    Comment.create(create_params)
    redirect_to controller: :articles, action: :index
  end

  private
  def create_params
    params.require(:comment).permit(:text).merge(article_id: params[:article_id],user_id: current_user[:id])
  end
end
