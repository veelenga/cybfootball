class UsersController < DeviseController
  def settings
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to settings_path, notice: t('devise.passwords.updated')
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :settings
    end
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
