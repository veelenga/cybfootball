require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'is valid with required attributes' do
    expect(build :team).to be_valid
  end

  it 'requires a team name' do
    expect(build :team, name: nil).not_to be_valid
  end

  it 'can have a list of players' do
    team = build :team, players: [build(:player)]
    expect(team.players).not_to be_empty
  end

  it 'can have a list of inhouse matches' do
    team = build :team, inhouse_matches: [build(:match)]
    expect(team.inhouse_matches).not_to be_empty
    expect(team.matches_as_a_guest).to be_empty
  end

  it 'can have a list of matches as a guest' do
    team = build :team, matches_as_a_guest: [build(:match)]
    expect(team.inhouse_matches).to be_empty
    expect(team.matches_as_a_guest).not_to be_empty
  end
end
