FactoryGirl.define do
  factory :player do
    sequence(:fio) { |n| "John Doe #{n}" }
    bio 'Super talented high skilled player'
    graduation_year Date.today.year
    degree 'PhD'

    factory :player_with_avatar do
      avatar { File.new "#{Rails.root}/spec/fixtures/avatar.png" }

      factory :invalid_player_with_avatar do
        fio nil
      end
    end
  end
end
