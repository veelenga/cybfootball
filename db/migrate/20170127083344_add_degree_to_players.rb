class AddDegreeToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :degree, :string
  end
end
