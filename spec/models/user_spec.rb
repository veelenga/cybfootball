require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be_valid }

  it 'requires role' do
    subject.role = nil
    expect(subject).not_to be_valid
  end

  describe '#set_default_role' do
    it { is_expected.to be_visitor }
  end

  describe 'roles' do
    it 'defines 3 main roles' do
      expect(User.roles.keys).to eql %w(visitor moderator admin)
    end
  end
end
