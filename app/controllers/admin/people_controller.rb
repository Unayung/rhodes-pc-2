class Admin::PeopleController < ApplicationController
  layout "admin"
  before_filter :login_required
  before_filter :require_is_admin
  
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to admin_people_path, :notice => "Person saved"
    else
      flash[:warning] = "Something went wrong :<"
      render :new
    end
  end

  def edit
    @person = Person.find_by_url(params[:id])
  end

  def update
    @person = Person.find_by_url(params[:id])

    if @person.update_attributes(params[:person])
      redirect_to admin_people_path, :notice => "Person Updated"
    else
      flash[:warning] = "Something went wrong :<"
      render :edit
    end
  end

  def destroy
    @person = Person.find_by_url(params[:id])
    @person.destroy

    redirect_to admin_people_path, :notice => "Person Deleted"
  end
end
