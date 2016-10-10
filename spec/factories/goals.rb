FactoryGirl.define do
  factory :goal do
    team
    match
    player

    kind 'general'
  end
end
