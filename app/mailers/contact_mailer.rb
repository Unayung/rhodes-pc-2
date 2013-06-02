class ContactMailer < ActionMailer::Base
  default from: "contact.rhodes.pc@gmail.com"

  def send_contact_form_to_admin(username, email, message)
    @username = username
    @email = email
    @message = message
    mail(:to => "amanda@rhodes-pc.com", :subject => "Message Notification - Rhodes-pc")
    # mail(:to => "unayung@gmail.com", :subject => "Message Notification - Rhodes-pc")
  end
end
