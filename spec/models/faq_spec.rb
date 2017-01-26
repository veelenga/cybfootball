require 'rails_helper'

describe Faq, type: :model do
  it 'is valid with required attributes' do
    expect(build :faq).to be_valid
  end

  it 'requires question' do
    expect(build :faq, question: nil).not_to be_valid
  end

  it 'requires answer' do
    expect(build :faq, answer: nil).not_to be_valid
  end

  it 'requires order' do
    expect(build :faq, order: nil).not_to be_valid
  end

  it 'sets default order' do
    faq = Faq.new question: 'hey', answer: 'yo'
    expect(faq).to be_valid
    expect(faq.order).not_to be_nil
  end
end
