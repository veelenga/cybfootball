require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    let(:user) { nil }
    subject(:ability) { Ability.new(user) }

    context 'when anonymous' do
      it { is_expected.to be_able_to(:read, :all) }
      it { is_expected.not_to be_able_to(:manage, :all) }
    end

    context 'when is admin' do
      let(:user) { build :root }
      it { is_expected.to be_able_to(:read, :all) }
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'when is visitor' do
      let(:user) { build :user }
      it { is_expected.to be_able_to(:read, :all) }
      it { is_expected.not_to be_able_to(:manage, :all) }
    end
  end
end
