module GlyphiconHelper
  def tournament_header_glyph
    content_tag(:i, nil, class: 'fa fa-trophy faa-tada animated-hover')
  end

  def teams_header_glyph
    content_tag(:i, nil, class: 'fa fa-users faa-tada animated-hover')
  end

  def players_header_glyph
    content_tag(:i, nil, class: 'fa fa-user faa-tada animated-hover')
  end

  def groups_header_glyph
    content_tag(:i, nil, class: 'fa fa-table faa-tada animated-hover')
  end

  def add_glyph
    content_tag(:i, nil, class: 'fa fa-plus faa-pulse animated-hover')
  end

  def edit_glyph
    content_tag(:i, nil, class: 'glyphicon glyphicon-pencil faa-pulse animated-hover')
  end

  def delete_glyph
    content_tag(:i, nil, class: 'glyphicon glyphicon-trash faa-pulse animated-hover')
  end

  def remove_glyph
    content_tag(:i, nil, class: 'glyphicon glyphicon-remove faa-pulse animated-hover')
  end

  def back_glyph
    content_tag(:i, nil, class: 'glyphicon glyphicon-chevron-left faa-pulse animated-hover')
  end

  def add_group_glyph
    content_tag(:i, nil, class: 'fa fa-plus faa-pulse animated-hover')
  end

  def settings_glyph
    content_tag(:i, nil, class: 'fa fa-cog faa-spin animated-hover')
  end
end
