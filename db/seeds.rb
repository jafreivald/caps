# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Resources"

resource_list = [
  'Condition',
  'Encounter',
  'Medication',
  'MedicationDispense',
  'MedicationPrescription',
  'Observation',
  'Patient'
]

resource_list.each do |r|
	Resource.where(:resource => r).first_or_create()
end

puts "FHIR Base URLs"

fhir_list = [
  'http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base/'
]

fhir_list.each do |url|
	FhirBaseUrl.where(:fhir_base_url => url).first_or_create()
end

puts "Severity Levels"

sl_list = [
  'Low',
  'Moderate',
  'Severe'
]

sl_list.each do |l|
	SeverityLevel.where(:severity_level => l).first_or_create()
end


puts "Activity Types"

at_list = [
  'Fill Prescription',
  'Take Medication',
  'Appointment',
  'Home Visit',
  'Personal Sanitation',
  'Recreational Activity',
  'Wake'
]

at_list.each do |a|
	ActivityType.where(:activity_type => a).first_or_create()
end

puts "Phone Type"

pt_list = [
  'Cell',
  'Home',
  'Work',
  'Fax',
  'Pager',
  "Doctor's Office",
  'Nurse Station'
]

pt_list.each do |t|
	PhoneType.where(:phone_type => t).first_or_create()
end

puts "Phone Providers"

pp_list = [
  'Other',
  'AT&T',
  'Verizon',
  'AT&T Mobility',
  'Verizon Wireless',
  'Time Warner',
  'Comcast',
  'Cricket',
  'Sprint',
  'T-Mobile',
  'Boost',
  'MetroPCS',
  'Net10',
  'TracFone',
  'US Cellular'
]

pp_list.each do |p|
	PhoneProvider.where(:phone_provider => p).first_or_create()
end

puts "Actions"

al_list = [
  'Acknowledge',
  'Completed',
  'Delivered',
  'Picked up',
  'Dropped off',
  'Waiting'
]

al_list.each do |a|
	Action.where(:action => a).first_or_create()
end

puts "Roles"

rl_list = [
  'Patient',
  'Designated Representative',
  'Full Support',
  'Medicines',
  'Logistics',
  'Transport'
]

rl_list.each do |r|
	Role.where(:role => r).first_or_create()
end

puts "Contact Methods"

cm_list = [
  'Call',
  'Text',
  'Email'
]

cm_list.each do |m|
	ContactMethod.where(:contact_method => m).first_or_create()
end




