class AddTitleToTournaments < ActiveRecord::Migration[5.0]
  def change
    rename_column :tournaments, :no, :title
    change_column :tournaments, :title, :string
  end
end
