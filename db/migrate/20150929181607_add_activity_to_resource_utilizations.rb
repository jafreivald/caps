class AddActivityToResourceUtilizations < ActiveRecord::Migration
  def up
    change_table :resource_utilizations do |t|
      t.references :activity
    end
    add_index :resource_utilizations, :activity_id
  end
  def down
    remove_column :resource_utilizations, :activity_id
  end
end
