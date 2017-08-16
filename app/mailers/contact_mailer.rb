class ContactMailer < ApplicationMailer

  # TODO: update admin email address
  def send_message user, subject, message
    @user = user
    @subject = subject
    @message = message
    mail to: Settings.admin_mail,
      reply_to: @user.email,
      subject: 'New user request'
  end

end
