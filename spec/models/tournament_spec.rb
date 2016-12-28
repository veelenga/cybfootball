require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'is valid with valid attributes' do
    expect(build :tournament).to be_valid
  end

  it 'requires title of tournament' do
    expect(build :tournament, title: nil).not_to be_valid
  end

  it 'is valid without description' do
    expect(build :tournament, description: nil).to be_valid
  end

  it 'requires date of tournament' do
    expect(build :tournament, date: nil).not_to be_valid
  end

  it "is date equals today" do
    tournament = build :tournament
    expect(tournament.date).to eq(Date.today)
  end

  it "is between the time range" do
    tournament = build :tournament
    expect(tournament.date).to be_between(Date.new(1990,1,1), 1.years.from_now.to_date)
  end

  it 'can have groups' do
    t = build :tournament, groups: [build(:group)]
    expect(t.groups).not_to be_empty
  end
end
