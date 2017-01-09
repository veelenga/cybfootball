class Group < ApplicationRecord
  belongs_to :tournament
  has_many :matches, dependent: :destroy
  has_and_belongs_to_many :teams, -> { distinct }

  validates_presence_of :name

  def update_team_list(team, action)
    case action.try(:to_sym)
      when :add
        self.teams << team
      when :delete
        self.teams.delete team
      else nil
    end
  end
end
