class Trail::Player < Player
  self.table_name = 'trail_players'

  belongs_to :player, optional: true
end
