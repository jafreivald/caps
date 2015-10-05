class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :field_type
      t.string :field_text
      t.references :resource

      t.timestamps
    end
    add_index :fields, :resource_id
  end
end
