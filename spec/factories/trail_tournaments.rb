FactoryGirl.define do
  factory :trail_tournament, class: 'Trail::Tournament' do
    title 'Changing tournament tilte'
    description 'Changing tournament description'
    sequence(:date) { |n| n.days.ago }
  end
end
