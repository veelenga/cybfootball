class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :fio
      t.string :bio
      t.integer :graduation_year

      t.timestamps
    end
  end
end
