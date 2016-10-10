require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'is valid with required attributes' do
    expect(build :match).to be_valid
  end

  it 'requires home team' do
    expect(build :match, home_team: nil).not_to be_valid
  end

  it 'requires guest team' do
    expect(build :match, guest_team: nil).not_to be_valid
  end
end
