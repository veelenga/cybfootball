class Team < ApplicationRecord
  has_and_belongs_to_many :players, -> { distinct }
  has_many :inhouse_matches, class_name: 'Match', inverse_of: :home_team
  has_many :matches_as_a_guest, class_name: 'Match', inverse_of: :guest_team
  has_many :goals

  validates :name, presence: true, uniqueness: true

  scope :by_name, ->(name) { where('lower(teams.name) LIKE ?', "%#{name.downcase}%")}

  def update_players_list(player, action)
    case action.try(:to_sym)
      when :add
        self.players << player
      when :delete
        self.players.delete player
      else nil
    end
  end
end
