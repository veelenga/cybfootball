module GlyphiconHelper

  def glyph(clazz, animation)
    content_tag(:i, nil, class: "#{clazz} faa-#{animation} animated-hover")
  end

  def tournament_header_glyph; glyph('fa fa-trophy', :tada) end
  def teams_header_glyph;      glyph('fa fa-users', :tada) end
  def players_header_glyph;    glyph('fa fa-user', :tada) end
  def groups_header_glyph;     glyph('fa fa-table', :tada) end

  def add_glyph;    glyph('fa fa-plus', :pulse) end
  def edit_glyph;   glyph('glyphicon glyphicon-pencil', :pulse) end
  def delete_glyph; glyph('glyphicon glyphicon-trash', :pulse) end
  def remove_glyph; glyph('glyphicon glyphicon-remove', :pulse) end
  def back_glyph;   glyph('glyphicon glyphicon-chevron-left', :pulse) end

  def add_group_glyph;  glyph('fa fa-table', :pulse) end
  def add_player_glyph; glyph('fa fa-user', :pulse) end
  def settings_glyph;   glyph('fa fa-cog', :spin) end
end
