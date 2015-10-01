class CreateResourceAuthorizations < ActiveRecord::Migration
  def change
    create_table :resource_authorizations do |t|
      t.references :role_definition
      t.references :resource

      t.timestamps
    end
    add_index :resource_authorizations, :role_definition_id
    add_index :resource_authorizations, :resource_id
  end
end
