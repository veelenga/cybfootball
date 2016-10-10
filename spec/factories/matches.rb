FactoryGirl.define do
  factory :match do
    association :home_team, factory: :team, strategy: :build
    association :guest_team, factory: :team, strategy: :build
  end
end
