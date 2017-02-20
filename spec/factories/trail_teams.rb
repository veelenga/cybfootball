FactoryGirl.define do
  factory :trail_team, class: 'Trail::Team' do
    sequence(:name, 0) { |n| "Dream Trail team # #{n}" }
  end
end
