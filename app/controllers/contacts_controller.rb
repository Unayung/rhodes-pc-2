class ContactsController < ApplicationController

  def send_form_information
    username = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.delay.send_contact_form_to_admin(username, email, message)

    flash[:info] = "Message sent, we will contact with you later."
    redirect_to root_path
  end

end
