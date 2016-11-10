DEFAULT_PASSWORD = 's3cr3t'

module ControllerMacros
  def sign_in!(role = :admin)
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in User
        .create_with(login: "john-[#{role}]", password: DEFAULT_PASSWORD, password_confirmation: DEFAULT_PASSWORD)
        .find_or_create_by!(role: User.roles[role])
    end
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end
