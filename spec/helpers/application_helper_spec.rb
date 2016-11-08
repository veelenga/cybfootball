require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#bootstrap_class_for' do
    it 'returns bootstrap alert classes' do
      expect(helper.bootstrap_class_for(:success)).to eql 'alert-success'
      expect(helper.bootstrap_class_for(:error)).to eql 'alert-danger'
      expect(helper.bootstrap_class_for(:alert)).to eql 'alert-warning'
      expect(helper.bootstrap_class_for(:notice)).to eql 'alert-success'
    end

    it 'returns type if thereis no such class' do
      expect(helper.bootstrap_class_for(:no_such_class)).to eql 'no_such_class'
    end
  end

  describe '#flash_messages' do
    it 'returns nil' do
      expect(helper.flash_messages).to be_nil
    end
  end
end
