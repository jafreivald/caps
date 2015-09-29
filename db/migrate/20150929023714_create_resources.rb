class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :resource

      t.timestamps
    end
    add_index :resources, :resource, :unique => true
  end
end
