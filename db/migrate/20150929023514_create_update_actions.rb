class CreateUpdateActions < ActiveRecord::Migration
  def change
    create_table :update_actions do |t|
      t.string :update_action

      t.timestamps
    end
    add_index :update_actions, :update_action, :unique => true
  end
end
