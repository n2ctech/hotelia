class AccountsController < BaseController

  def show
  end

  def update
    unless current_user.valid_password?(params[:user][:current_password])
      current_user.errors.add :base, t('.wrong_password')
      render :show
      return
    end

    if current_user.update(user_params)
      flash[:success] = t('.success')
      redirect_back(fallback_location: account_path)
    else
      render :show
    end
end

  private
  def user_params
    permitted_params = params.require(:user).permit :email, :locale, :currency
    if params[:user][:password].present?
      permitted_params[:password] = params[:user][:password]
      permitted_params[:password_confirmation] = params[:user][:password_confirmation]
    end
    permitted_params
  end

end
