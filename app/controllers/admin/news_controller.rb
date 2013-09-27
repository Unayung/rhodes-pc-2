class Admin::NewsController < ApplicationController
  layout "admin"
  before_filter :login_required

  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      redirect_to admin_news_index_path, :notice => "News saved"
    else
      flash[:warning] = "Something went wrong :<"
      render :new
    end
  end

  def edit
    @news = News.find_by_url(params[:id])
  end

  def update
    @news = News.find_by_url(params[:id])

    if @news.update_attributes(params[:news])
      redirect_to admin_news_index_path, :notice => "News Updated"
    else
      flash[:warning] = "Something went wrong :<"
      render :edit
    end
  end

  def destroy
    @news = News.find_by_url(params[:id])
    @news.destroy

    redirect_to admin_news_index_path, :notice => "News Deleted"
  end
end
