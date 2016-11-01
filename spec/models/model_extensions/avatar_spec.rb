require 'rails_helper'

describe ModelExtensions::Avatar do
  subject { Player }
  let(:instance) { subject.new }

  describe 'ClassMethods' do
    it 'create has_avatar class method' do
      expect(subject).to respond_to :has_avatar
    end

    it 'creates crop attribute accessors' do
      %w(crop_x crop_y crop_w crop_h avatar).each do |attr|
        expect(instance).to respond_to :"#{attr}"
        expect(instance).to respond_to :"#{attr}="
      end
    end
  end

  describe 'InstanceMethods' do
    it 'extends with styles method' do
      expect(instance).to respond_to :styles
    end

    it 'extends with cropping? method' do
      expect(instance).to respond_to :styles
    end
  end
end
