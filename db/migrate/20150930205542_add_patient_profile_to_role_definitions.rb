class AddPatientProfileToRoleDefinitions < ActiveRecord::Migration
  def change
    add_column :role_definitions, :patient_profile_id, :integer, null: false, default: 1
    add_index :role_definitions, :patient_profile_id
  end
end
