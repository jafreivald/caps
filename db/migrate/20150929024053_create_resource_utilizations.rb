class CreateResourceUtilizations < ActiveRecord::Migration
  def change
    create_table :resource_utilizations do |t|
      t.references :resource
      t.references :fhir_base_url

      t.timestamps
    end
    add_index :resource_utilizations, :resource_id
    add_index :resource_utilizations, :fhir_base_url_id
  end
end
