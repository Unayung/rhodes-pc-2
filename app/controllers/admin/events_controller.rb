class Admin::EventsController < ApplicationController
  layout "admin"
  before_filter :login_required
  before_filter :require_is_admin

  def index
    if params[:month].present?
      @month = params[:month]
    else
      @month = Date.today.month
    end
    @year = Date.today.year
    @events = Event.is_previous(@month)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to admin_events_path, :notice => "Event saved"
    else
      flash[:warning] = "Something went wrong :<"
      render :new
    end
  end

  def edit
    @event = Event.find_by_url(params[:id])
  end

  def update
    @event = Event.find_by_url(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to admin_events_path, :notice => "Event Updated"
    else
      flash[:warning] = "Something went wrong :<"
      render :edit
    end
  end

  def destroy
    @event = Event.find_by_url(params[:id])
    @event.destroy

    redirect_to admin_events_path, :notice => "Event Deleted"
  end
end
