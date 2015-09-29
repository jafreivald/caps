class CreateSeverityLevels < ActiveRecord::Migration
  def change
    create_table :severity_levels do |t|
      t.string :severity_level

      t.timestamps
    end
    add_index :severity_levels, :severity_level, :unique => true
  end
end
