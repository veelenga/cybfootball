class Team < ApplicationRecord
  has_and_belongs_to_many :players, -> { distinct }
  has_many :inhouse_matches, class_name: 'Match', inverse_of: :home_team
  has_many :matches_as_a_guest, class_name: 'Match', inverse_of: :guest_team
  has_many :goals

  validates :name, presence: true, uniqueness: true

  scope :by_name, ->(name) { where('teams.name ~* ?', ".*#{name}.*")}

  has_attached_file :avatar, styles: { thumb: '300x200>' }, default_url: '/images/default_team_avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

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
