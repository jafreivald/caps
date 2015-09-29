class CreateFhirBaseUrls < ActiveRecord::Migration
  def change
    create_table :fhir_base_urls do |t|
      t.string :fhir_base_url

      t.timestamps
    end
    add_index :fhir_base_urls, :fhir_base_url, :unique => true
  end
end
