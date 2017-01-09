class AddGroupsMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_teams, id: false do |t|
      t.integer :group_id
      t.integer :team_id
    end
  end
end
