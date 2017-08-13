class ContactMailer < ApplicationMailer

  # TODO: update admin email address
  def send_message user, subject, message
    @user = user
    @subject = subject
    @message = message
    mail to: 'giangnguyen1089@gmail.com',
      reply_to: @user.email,
      subject: 'New user request'
  end

end
