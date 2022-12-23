class SearchController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
    # .page(params[:page]).per(10)
  end
end
