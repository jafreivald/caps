require 'faker'

FactoryGirl.define do
  factory :role_definition do |f|
#    before(:create) do |role_definition|
#      rt = ResourceType.where(:resource_type => "Patient").first_or_create()
#      role_definition.patient_resource = Resource.where(:fhir_base_url_id => 1, :fhir_resource_id => 1, :resource_type_id => rt.id).first_or_create()
#    end
    association :role
    association :profile
    association :patient_resource
  end
end
