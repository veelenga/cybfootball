require 'rails_helper'

describe ModelExtensions::Avatar do
  subject { Player }
  let(:instance) { build :player_with_avatar }
  let(:invalid_instance) { build :invalid_player_with_avatar }

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

    describe 'before_save' do
      it 'does not update instance if it is not cropped' do
        instance.save
        expect { instance.save! }.not_to change(instance, :updated_at)
      end

      it 'updates instance if it is cropped' do
        instance.save
        instance.assign_attributes crop_x: 0, crop_y: 0, crop_w: 10, crop_h: 10
        expect { instance.save! }.to change(instance, :updated_at)
      end
    end

    describe 'after_validation' do
      it 'restores avatar file name if instance invalid' do
        url = invalid_instance.avatar.url
        invalid_instance.save
        expect(invalid_instance.avatar.url).not_to eql url
      end
    end
  end

  describe 'InstanceMethods' do
    it 'extends with styles method' do
      expect(instance).to respond_to :styles
    end

    describe '#cropping?' do
      it 'extends with cropping? method' do
        expect(instance).to respond_to :cropping?
      end

      it 'returns true if required attributes present' do
        instance.assign_attributes crop_x: 3, crop_y: 10, crop_w: 44, crop_h: 2
        expect(instance).to be_cropping
      end

      it 'returns false if some of required attributes present' do
        instance.assign_attributes crop_x: 0, crop_y: 1, crop_w: 4, crop_h: 2, avatar: nil
        expect(instance).not_to be_cropping
      end
    end
  end
end
