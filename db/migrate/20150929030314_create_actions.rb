class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :action

      t.timestamps
    end
    add_index :actions, :action, :unique => true
  end
end
