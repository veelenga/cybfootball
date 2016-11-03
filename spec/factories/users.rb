FactoryGirl.define do
  factory :user do
    login 'John'
    password 's3cr3t'
    password_confirmation 's3cr3t'
  end
end
