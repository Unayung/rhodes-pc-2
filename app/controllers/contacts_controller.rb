class ContactsController < ApplicationController

  def send_form_information
    username = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.send_contact_form_to_admin(username, email, message)

    redirect_to root_path
  end

end
