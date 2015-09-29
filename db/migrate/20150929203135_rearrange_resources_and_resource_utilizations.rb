class RearrangeResourcesAndResourceUtilizations < ActiveRecord::Migration
  def change
    remove_index :resource_utilizations, :fhir_base_url_id
    remove_column :resource_utilizations, :fhir_base_url_id
    
    remove_index :resources, :resource
    remove_column :resources, :resource
    
    change_table :resources do |t|
      t.references :resource_type
      t.references :fhir_base_url
      t.integer :fhir_resource_id
    end
    add_index :resources, [ :resource_type_id, :fhir_base_url_id, :fhir_resource_id ], :unique => true, :name => "resources_uniqueness_index"
    
  end
end
