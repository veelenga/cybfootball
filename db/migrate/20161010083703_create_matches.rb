class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :home_team
      t.references :guest_team
      t.timestamps
    end

    change_table :goals do |t|
      t.belongs_to :match, index: true
      t.belongs_to :team, index: true
    end
  end
end
