FactoryGirl.define do
  factory :tournament do
    title '1st tournament of faculty of cybernetics'
    description 'This is the first tournament'
    sequence(:date) { |n| n.days.ago }
  end
end
