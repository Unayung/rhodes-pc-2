class NewsController < ApplicationController
  layout "bio"

  def show
    @news = News.find_by_url(params[:id])
  end

end
