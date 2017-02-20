class CreateTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trail_players do |t|
      t.string     :fio
      t.text       :bio
      t.integer    :graduation_year
      t.string     :degree
      t.attachment :avatar

      t.timestamps
    end
    add_reference :trail_players, :player, index: true, foreign_key: true

    create_table :trail_teams do |t|
      t.string     :name
      t.attachment :avatar

      t.timestamps
    end
    add_reference :trail_teams, :team, index: true, foreign_key: true

    create_table :trail_tournaments do |t|
      t.string     :title
      t.text       :description
      t.date       :date

      t.timestamps
    end
    add_reference :trail_tournaments, :tournament, index: true, foreign_key: true
  end
end
