class ChangeRoleDefinitionResourceUtilizationToFhirPatientResourceId < ActiveRecord::Migration
  def change
    remove_index :role_definitions, :resource_utilization_id
    rename_column :role_definitions, :resource_utilization_id, :fhir_patient_resource_id
    add_index :role_definitions, :fhir_patient_resource_id
  end
end
