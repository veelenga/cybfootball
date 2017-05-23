FactoryGirl.define do
  factory :trail_player, class: 'Trail::Player' do
    sequence(:fio) { |n| "Trail John Doe #{n}" }
    bio 'Editing player bio'
    graduation_year Date.today.year
    degree 'Dr.'
  end
end
