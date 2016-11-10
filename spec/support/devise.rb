module ControllerMacros
  def sign_in!(role = :admin)
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[role]
      sign_in User.create_with(login: "john-[#{role}]").find_or_create_by!(role: role)
    end
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end
