require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it { is_expected.to be_valid }

  it 'requires role' do
    subject.role = nil
    expect(subject).not_to be_valid
  end

  it 'requires login' do
    subject.login = nil
    expect(subject).not_to be_valid
  end

  it 'requires password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it 'requires password confirmation' do
    subject.password = '123456'
    subject.password_confirmation = '321'
    expect(subject).not_to be_valid
  end

  it 'requires length minimum of password to be 6' do
    subject.password = '123'
    subject.password_confirmation = '123'
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
