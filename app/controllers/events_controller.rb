class EventsController < ApplicationController

  def show
    @file = Event.find_by_url(params[:id]).event_file.path
    send_file( @file, :disposition => 'inline', :type => "application/pdf")
  end

  def download
    @file = Event.find_by_url(params[:id]).event_file.path
    send_file @file
  end
end
