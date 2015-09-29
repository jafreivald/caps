class CreatePhoneProviders < ActiveRecord::Migration
  def change
    create_table :phone_providers do |t|
      t.string :phone_provider

      t.timestamps
    end
    add_index :phone_providers, :phone_provider, :unique => true
  end
end
