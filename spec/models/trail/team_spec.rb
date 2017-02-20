require 'rails_helper'

describe Trail::Team, type: :model do
  it 'inherits from Team' do
    expect(Trail::Team.superclass).to be Team
  end

  it 'inherits validation stuff' do
    expect(build :trail_team).to be_valid
  end
end
