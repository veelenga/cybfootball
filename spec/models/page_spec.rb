require 'rails_helper'

describe Page, type: :model do
  it 'is valid' do
    expect(build :page).to be_valid
  end

  it 'requires presence of path' do
    expect(build :page, path: nil).not_to be_valid
  end

  it 'requires presence of title' do
    expect(build :page, title: nil).not_to be_valid
  end

  it 'requires presence of content' do
    expect(build :page, content: nil).not_to be_valid
  end

  it 'requires uniqueness of path' do
    create :page, path: 'about'
    expect(build(:page, path: 'about')).not_to be_valid
  end
end
