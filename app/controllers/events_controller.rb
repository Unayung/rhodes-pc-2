class EventsController < ApplicationController
  layout "bio"
  
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end

  def show
    @file = Event.find_by_url(params[:id]).event_file.path
    send_file( @file, :disposition => 'inline', :type => "application/pdf")
  end

  def download
    @file = Event.find_by_url(params[:id]).event_file.path
    send_file @file
  end
end
