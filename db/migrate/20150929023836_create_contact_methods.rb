class CreateContactMethods < ActiveRecord::Migration
  def change
    create_table :contact_methods do |t|
      t.string :contact_method

      t.timestamps
    end
    add_index :contact_methods, :contact_method, :unique => true
  end
end
