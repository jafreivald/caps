class ChangeRoleDefinitionsPatientProfileToAPatientResource < ActiveRecord::Migration
  def change
    rename_column :role_definitions, :patient_profile_id, :patient_resource_id
  end
end
