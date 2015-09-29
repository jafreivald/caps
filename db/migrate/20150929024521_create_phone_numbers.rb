class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :country_code
      t.string :area_code
      t.string :number
      t.references :phone_provider
      t.references :phone_type

      t.timestamps
    end
    add_index :phone_numbers, :phone_provider_id
    add_index :phone_numbers, :phone_type_id
  end
end
