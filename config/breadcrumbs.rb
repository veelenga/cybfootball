crumb :root do
  link t('gen.home'), root_path
end

crumb :tournament do |tournament|
  link tournament.title, tournament_path(tournament)
end

crumb :new_tournament do
  link t('views.tournaments.new.title'), tournaments_path
end

crumb :group do |group|
  link group.name, groups_path
  parent :tournament, group.tournament
end

crumb :teams do
  link t('gen.teams'), teams_path
end

crumb :team do |team|
  link team.name, team_path(team)
  parent :teams
end

crumb :new_team do
  link t('views.teams.new.title'), teams_path
  parent :teams
end

crumb :players do
  link t('gen.players'), players_path
end

crumb :player do |player|
  link player.fio, player_path(player)
  parent :players
end

crumb :new_player do
  link t('views.players.new.title'), players_path
  parent :players
end

