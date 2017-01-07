require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    expect(build :group).to be_valid
  end

  it 'requires name' do
    expect(build :group, name: nil).not_to be_valid
  end

  it 'can have matches' do
    g = build :group, matches: [build(:match)]
    expect(g.matches).not_to be_empty
  end

  it 'can have matches' do
    g = build :group, teams: [build(:team)]
    expect(g.teams).not_to be_empty
  end

  it 'can have distinct teams' do
    group = build :group
    team = build :team
    group.teams << team << team
    expect(group.teams.size).to be 1
  end

  describe '#update_team_list' do
    let(:group) { build(:group) }
    let(:team) { build(:team) }

    it 'can add a team' do
      group.update_team_list(team, 'add')
      expect(group.teams).to include team
    end

    it 'can remove a team' do
      group.teams << team
      group.update_team_list(team, 'delete')
      expect(group.teams).not_to include [team]
    end
  end
end
