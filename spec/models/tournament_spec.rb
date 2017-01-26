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

  it 'sets default date' do
    tournament = Tournament.new title: 'yo!'
    expect(tournament.date).to eq(Date.today)
  end

  it 'is between the time range' do
    tournament = build :tournament
    expect(tournament.date).to be_between(Date.new(1990,1,1), 1.years.from_now.to_date)
  end

  it 'can have groups' do
    t = build :tournament, groups: [build(:group)]
    expect(t.groups).not_to be_empty
  end

  describe '.recent' do
    it 'returns recent n tournaments' do
      create_list(:tournament, 2)
      expect(Tournament.recent(1).count).to eql 1
    end

    it 'returns empty array if there is no tournaments' do
      expect(Tournament.recent(0)).to be_empty
    end
  end
end
