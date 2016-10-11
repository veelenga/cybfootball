class CreatePlayersAndTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :fio
      t.text :bio
      t.integer :graduation_year
      t.timestamps
    end
    add_index :players, :fio

    create_table :teams do |t|
      t.string :name
      t.timestamps
    end
    add_index :teams, :name

    create_table :players_teams, id: false do |t|
      t.belongs_to :player, index: true
      t.belongs_to :team, index: true
    end
  end
end
