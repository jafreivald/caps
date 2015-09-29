class CreateRoleDefinitions < ActiveRecord::Migration
  def change
    create_table :role_definitions do |t|
      t.references :role
      t.references :profile
      t.references :resource_utilization

      t.timestamps
    end
    add_index :role_definitions, :role_id
    add_index :role_definitions, :profile_id
    add_index :role_definitions, :resource_utilization_id
  end
end
