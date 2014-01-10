# -*- encoding : utf-8 -*-
class ContactsController < ApplicationController

  include ActionView::Helpers::SanitizeHelper

  def send_form_information
    username = params[:name]
    email = params[:email]
    message = strip_tags(sanitize(params[:message]))

    if username.present? && email.present? && message.present? && simple_captcha_valid?
      ContactMailer.delay.send_contact_form_to_admin(username, email, message)
      flash[:info] = "Message sent, we will contact with you later. Thanks."
    else
      flash[:warning] = "You have to fill all the columns. Thanks."
    end
    
    redirect_to root_path
  end

end
