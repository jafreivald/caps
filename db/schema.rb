# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151016211256) do

  create_table "actions", :force => true do |t|
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "actions", ["action"], :name => "index_actions_on_action", :unique => true

  create_table "activities", :force => true do |t|
    t.string   "base_time"
    t.string   "repeat_rule"
    t.integer  "severity_level_id"
    t.integer  "role_definition_id"
    t.integer  "activity_type_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "activities", ["activity_type_id"], :name => "index_activities_on_activity_type_id"
  add_index "activities", ["role_definition_id"], :name => "index_activities_on_role_definition_id"
  add_index "activities", ["severity_level_id"], :name => "index_activities_on_severity_level_id"

  create_table "activity_types", :force => true do |t|
    t.string   "activity_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "activity_types", ["activity_type"], :name => "index_activity_types_on_activity_type", :unique => true

  create_table "activity_updates", :force => true do |t|
    t.text     "narrative"
    t.integer  "activity_id"
    t.integer  "profile_id"
    t.integer  "action_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "activity_updates", ["action_id"], :name => "index_activity_updates_on_action_id"
  add_index "activity_updates", ["activity_id"], :name => "index_activity_updates_on_activity_id"
  add_index "activity_updates", ["profile_id"], :name => "index_activity_updates_on_profile_id"

  create_table "contact_methods", :force => true do |t|
    t.string   "contact_method"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "contact_methods", ["contact_method"], :name => "index_contact_methods_on_contact_method", :unique => true

  create_table "contact_numbers", :force => true do |t|
    t.boolean  "preferred",         :default => true
    t.integer  "contact_method_id"
    t.integer  "phone_number_id"
    t.integer  "profile_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "contact_numbers", ["contact_method_id"], :name => "index_contact_numbers_on_contact_method_id"
  add_index "contact_numbers", ["phone_number_id"], :name => "index_contact_numbers_on_phone_number_id"
  add_index "contact_numbers", ["profile_id"], :name => "index_contact_numbers_on_profile_id"

  create_table "fhir_base_urls", :force => true do |t|
    t.string   "fhir_base_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "fhir_base_urls", ["fhir_base_url"], :name => "index_fhir_base_urls_on_fhir_base_url", :unique => true

  create_table "fields", :force => true do |t|
    t.string   "field_type"
    t.string   "field_text"
    t.integer  "resource_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "fields", ["resource_id"], :name => "index_fields_on_resource_id"

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.text     "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "uid",                          :null => false
    t.string   "secret",                       :null => false
    t.text     "redirect_uri",                 :null => false
    t.string   "scopes",       :default => "", :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "phone_numbers", :force => true do |t|
    t.string   "country_code"
    t.string   "area_code"
    t.string   "number"
    t.integer  "phone_provider_id"
    t.integer  "phone_type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "phone_numbers", ["phone_provider_id"], :name => "index_phone_numbers_on_phone_provider_id"
  add_index "phone_numbers", ["phone_type_id"], :name => "index_phone_numbers_on_phone_type_id"

  create_table "phone_providers", :force => true do |t|
    t.string   "phone_provider"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "phone_providers", ["phone_provider"], :name => "index_phone_providers_on_phone_provider", :unique => true

  create_table "phone_types", :force => true do |t|
    t.string   "phone_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phone_types", ["phone_type"], :name => "index_phone_types_on_phone_type", :unique => true

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "userid"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "resource_authorizations", :force => true do |t|
    t.integer  "role_definition_id"
    t.integer  "resource_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "resource_authorizations", ["resource_id"], :name => "index_resource_authorizations_on_resource_id"
  add_index "resource_authorizations", ["role_definition_id"], :name => "index_resource_authorizations_on_role_definition_id"

  create_table "resource_types", :force => true do |t|
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "resource_utilizations", :force => true do |t|
    t.integer  "resource_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "activity_id"
  end

  add_index "resource_utilizations", ["activity_id"], :name => "index_resource_utilizations_on_activity_id"
  add_index "resource_utilizations", ["resource_id"], :name => "index_resource_utilizations_on_resource_id"

  create_table "resources", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "resource_type_id"
    t.integer  "fhir_base_url_id"
    t.integer  "fhir_resource_id"
  end

  add_index "resources", ["resource_type_id", "fhir_base_url_id", "fhir_resource_id"], :name => "resources_uniqueness_index", :unique => true

  create_table "role_definitions", :force => true do |t|
    t.integer  "role_id"
    t.integer  "profile_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "patient_resource_id", :default => 1, :null => false
  end

  add_index "role_definitions", ["patient_resource_id"], :name => "index_role_definitions_on_patient_profile_id"
  add_index "role_definitions", ["profile_id"], :name => "index_role_definitions_on_profile_id"
  add_index "role_definitions", ["role_id"], :name => "index_role_definitions_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["role"], :name => "index_roles_on_role", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "severity_levels", :force => true do |t|
    t.string   "severity_level"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "severity_levels", ["severity_level"], :name => "index_severity_levels_on_severity_level", :unique => true

  create_table "update_actions", :force => true do |t|
    t.string   "update_action"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "update_actions", ["update_action"], :name => "index_update_actions_on_update_action", :unique => true

end
