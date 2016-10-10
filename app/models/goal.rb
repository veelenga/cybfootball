class Goal < ApplicationRecord
  enum kind: [:general, :penalty, :autogoal]
  belongs_to :player
  belongs_to :match
  belongs_to :team
end
