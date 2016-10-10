FactoryGirl.define do
  factory :player do
    fio 'John Doe'
    bio 'Super talented high skilled player'
    graduation_year Date.today.year
  end
end
