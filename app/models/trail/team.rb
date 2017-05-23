class Trail::Team < Team
  self.table_name = 'trail_teams'

  belongs_to :team, optional: true
end
