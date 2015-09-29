class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :base_time
      t.string :repeat_rule
      t.references :severity_level
      t.references :role_definition
      t.references :activity_type

      t.timestamps
    end
    add_index :activities, :severity_level_id
    add_index :activities, :role_definition_id
    add_index :activities, :activity_type_id
  end
end
