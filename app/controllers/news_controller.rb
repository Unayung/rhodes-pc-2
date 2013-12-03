class NewsController < ApplicationController
  layout "bio"

  def show
    @news = News.find_by_url(params[:id])
  end

  def index
    @news = News.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
end
