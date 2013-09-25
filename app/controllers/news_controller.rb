class NewsController < ApplicationController
  layout "bio"

  def show
    @news = News.find(params[:id])
  end

end
