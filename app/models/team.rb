class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :inhouse_matches, class_name: 'Match', inverse_of: :home_team
  has_many :matches_as_a_guest, class_name: 'Match', inverse_of: :guest_team
  has_many :goals

  validates :name, presence: true, uniqueness: true

  scope :by_name, ->(name) { where('lower(teams.name) LIKE ?', "%#{name.downcase}%")}
end
