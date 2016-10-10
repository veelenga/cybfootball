class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :inhouse_matches, class_name: 'Match', inverse_of: :home_team
  has_many :matches_as_a_guest, class_name: 'Match', inverse_of: :guest_team
  has_many :goals

  validates_presence_of :name
end
