FactoryGirl.define do
  factory :page do
    sequence(:path) { |n| "TestPage #{n}" }
    title 'About us'
    content 'We are awesome'
  end
end
