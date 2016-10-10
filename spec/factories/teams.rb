FactoryGirl.define do
  factory :team do
    sequence(:name, 0) { |n| "Dream Team # #{n}"}
  end
end
