class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource.try :active_for_authentication?
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, self.resource)
      redirect_back fallback_location: root_path
    else
      @user = User.new(sign_in_params)
      respond_to do |format|
        format.js { render 'new.js', alert: 'Unable to sing-in' }
      end
    end
  end
end
