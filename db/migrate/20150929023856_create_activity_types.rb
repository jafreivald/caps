class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :activity_type

      t.timestamps
    end
    add_index :activity_types, :activity_type, :unique => true
  end
end
