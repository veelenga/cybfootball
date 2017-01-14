require 'rails_helper'

describe GlyphiconHelper, type: :helper do
  it 'has tournament_header_glyph' do
    expect(tournament_header_glyph).to eql '<i class="fa fa-trophy faa-tada animated-hover"></i>'
  end

  it 'has teams_header_glyph' do
    expect(teams_header_glyph).to eql '<i class="fa fa-users faa-tada animated-hover"></i>'
  end

  it 'has players_header_glyph' do
    expect(players_header_glyph).to eql '<i class="fa fa-user faa-tada animated-hover"></i>'
  end

  it 'has groups_header_glyph' do
    expect(groups_header_glyph).to eql '<i class="fa fa-table faa-tada animated-hover"></i>'
  end

  it 'has add_glyph' do
    expect(add_glyph).to eql '<i class="fa fa-plus faa-pulse animated-hover"></i>'
  end

  it 'has edit_glyph' do
    expect(edit_glyph).to eql '<i class="glyphicon glyphicon-pencil faa-pulse animated-hover"></i>'
  end

  it 'has delete_glyph' do
    expect(delete_glyph).to eql '<i class="glyphicon glyphicon-trash faa-pulse animated-hover"></i>'
  end

  it 'has remove_glyph' do
    expect(remove_glyph).to eql '<i class="glyphicon glyphicon-remove faa-pulse animated-hover"></i>'
  end

  it 'has back_glyph' do
    expect(back_glyph).to eql '<i class="glyphicon glyphicon-chevron-left faa-pulse animated-hover"></i>'
  end
end
