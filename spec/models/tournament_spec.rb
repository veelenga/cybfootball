require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'is valid with valid attributes' do
    expect(build :tournament).to be_valid
  end

  it 'requires number of tournament' do
    expect(build :tournament, no: nil).not_to be_valid
  end

  it 'is valid without description' do
    expect(build :tournament, description: nil).to be_valid
  end

  it 'is valid without date' do
    expect(build :tournament, date: nil).to be_valid
  end

  it 'can have groups' do
    t = build :tournament, groups: [build(:group)]
    expect(t.groups).not_to be_empty
  end
end
