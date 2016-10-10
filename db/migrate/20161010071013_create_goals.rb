class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :kind, default: 0
      t.belongs_to :player, index: true
      t.timestamps
    end
  end
end
