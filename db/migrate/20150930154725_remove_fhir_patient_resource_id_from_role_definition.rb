class RemoveFhirPatientResourceIdFromRoleDefinition < ActiveRecord::Migration
  def change
    remove_index :role_definitions, :fhir_patient_resource_id
    remove_column :role_definitions, :fhir_patient_resource_id
  end
end
