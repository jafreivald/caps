class CreateResourceTypes < ActiveRecord::Migration
  def change
    create_table :resource_types do |t|
      t.string :resource_type

      t.timestamps
    end
  end
end
