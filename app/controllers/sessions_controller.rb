class SessionsController < Devise::SessionsController
  skip_load_and_authorize_resource

  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource.try :active_for_authentication?
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, self.resource)
      redirect_back fallback_location: root_path, notice: t('devise.sessions.signed_in')
    else
      @user = User.new(sign_in_params)
      flash.now[:error] = t('devise.failure.invalid', authentication_keys: User.human_attribute_name(:login).try(:downcase))
      respond_to do |format|
        format.js { render 'new.js' }
      end
    end
  end
end
