require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build(:player) }

  it 'is valid with required attributes' do
    expect(player).to be_valid
  end

  it 'is not valid without fio' do
    expect(build :player, fio: nil).not_to be_valid
  end

  it 'is valid without bio' do
    expect(build :player, bio: nil).to be_valid
  end

  it 'is valid without graduation year' do
    expect(build :player, graduation_year: nil).to be_valid
  end

  it 'assignes default attributes' do
    expect(Player.new.graduation_year).not_to be_nil
  end
end
