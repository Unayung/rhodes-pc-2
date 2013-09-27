class PeopleController < ApplicationController
  layout "bio"
  
  def show
    @person = Person.find_by_url(params[:id])
  end
end
