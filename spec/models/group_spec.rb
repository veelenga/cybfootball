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
end
