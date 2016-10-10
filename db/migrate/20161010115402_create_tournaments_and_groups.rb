class CreateTournamentsAndGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.integer :no
      t.string :description
      t.date :date

      t.timestamps
    end

    create_table :groups do |t|
      t.belongs_to :tournament, index: true
      t.string :name

      t.timestamps
    end

    change_table :matches do |t|
      t.belongs_to :group, index: true
    end
  end
end
