require 'faker'

FactoryGirl.define do
  factory :role_definition do |f|
    rt = ResourceType.where(:resource_type => "Patient").first_or_create()
    p = Resource.where(:fhir_base_url_id => 1, :fhir_resource_id => 1, :resource_type_id => rt.id).first_or_create()
    f.patient_resource_id { p.id }
    association :role
    association :profile
    #association :patient_resource, :factory => :resource
  end
end
