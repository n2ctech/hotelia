class QuoteOrderMailer < ApplicationMailer
  def send_quote user, quote_order
    @user = user
    @quote_order = quote_order
    mail to: Rails.application.secrets.admin_mail,
      reply_to: @user.email,
      subject: 'Create quote order'
  end
end
