class ContactsController < ApplicationController

  def create
    ContactMailer.send_message(current_user, params[:subject], params[:message]).deliver_later
    flash[:success] = t('.your_message_has_been_sent')
    redirect_back(fallback_location: root_path)
  end

end
