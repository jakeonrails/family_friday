class AddAvailableToTeamMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :team_members, :available, :boolean

    add_index :team_members, [:available]
  end
end
