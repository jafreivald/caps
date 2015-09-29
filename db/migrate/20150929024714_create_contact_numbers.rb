class CreateContactNumbers < ActiveRecord::Migration
  def change
    create_table :contact_numbers do |t|
      t.boolean :preferred
      t.references :contact_method
      t.references :phone_number
      t.references :profile

      t.timestamps
    end
    add_index :contact_numbers, :contact_method_id
    add_index :contact_numbers, :phone_number_id
    add_index :contact_numbers, :profile_id
  end
end
