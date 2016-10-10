require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'is valid with required attributes' do
    expect(build :goal).to be_valid
  end

  it 'requires player' do
    expect(build :goal, player: nil).not_to be_valid
  end

  it 'requires team' do
    expect(build :goal, team: nil).not_to be_valid
  end

  it 'requires match' do
    expect(build :goal, match: nil).not_to be_valid
  end

  it 'can change goal type' do
    expect(build :goal, kind: 'general').to be_general
    expect(build :goal, kind: 'penalty').to be_penalty
    expect(build :goal, kind: 'autogoal').to be_autogoal
  end
end
