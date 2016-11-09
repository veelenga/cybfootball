require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build(:player) }
  let(:player_with_avatar) { build(:player_with_avatar) }

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

  it 'can have avatar' do
    expect(player_with_avatar).to be_valid
    expect(player_with_avatar.avatar).not_to be_nil
  end

  describe '.fio_like' do
    it 'does case insensitive search by fio attribute' do
      players = create_list :player, 3, fio: 'John Doe'
      expect(Player.fio_like('John')).to match players
      expect(Player.fio_like('doe')).to match players
      expect(Player.fio_like('wrong')).to match []
    end

    it 'works on utf-8' do
      player = create :player, fio: 'Вовік'
      expect(Player.fio_like('В')).to match [player]
      expect(Player.fio_like('во')).to match [player]
      expect(Player.fio_like('вовк')).not_to include [player]
    end
  end
end
