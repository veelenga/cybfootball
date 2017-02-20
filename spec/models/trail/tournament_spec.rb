require 'rails_helper'

describe Trail::Tournament, type: :model do
  it 'inherits from Tournament' do
    expect(Trail::Tournament.superclass).to be Tournament
  end

  it 'inherits validation stuff' do
    expect(build :trail_tournament).to be_valid
  end
end
