require 'rails_helper'

describe Trail::Player, type: :model do
  it 'inherits from Player' do
    expect(Trail::Player.superclass).to be Player
  end

  it 'inherits validation stuff' do
    expect(build :trail_player).to be_valid
  end
end
