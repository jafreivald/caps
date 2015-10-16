class ChangeContactNumberPreferredColumnToHaveDefaultOfFalse < ActiveRecord::Migration
  def up
    change_column :contact_numbers, :preferred, :boolean, :default => true
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot remove the default for this column. "
  end
end
