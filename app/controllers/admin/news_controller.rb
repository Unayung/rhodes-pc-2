class Admin::NewsController < ApplicationController
  before_filter :login_required

  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      redirect_to root_path, :notice => "News saved"
    else
      flash[:warning] = "Something went wrong :<"
      render :new
    end
  end
end
