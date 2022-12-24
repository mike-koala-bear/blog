class SearchController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true).includes(:user, :rich_text_body)
    # .page(params[:page]).per(10)
  end
end
