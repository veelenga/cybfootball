class Trail::Tournament < Tournament
  self.table_name = 'trail_tournaments'

  belongs_to :tournament, optional: true
end
