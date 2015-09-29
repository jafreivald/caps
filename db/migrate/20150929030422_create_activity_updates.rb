class CreateActivityUpdates < ActiveRecord::Migration
  def change
    create_table :activity_updates do |t|
      t.text :narrative
      t.references :activity
      t.references :profile
      t.references :action

      t.timestamps
    end
    add_index :activity_updates, :activity_id
    add_index :activity_updates, :profile_id
    add_index :activity_updates, :action_id
  end
end
