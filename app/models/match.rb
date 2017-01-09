class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :guest_team, class_name: 'Team', foreign_key: 'guest_team_id'
  has_many :goals, dependent: :destroy

  validates_presence_of :home_team, :guest_team
end
