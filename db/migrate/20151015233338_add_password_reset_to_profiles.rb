class AddPasswordResetToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :password_reset_token, :string
    add_column :profiles, :password_reset_sent_at, :datetime
  end
end
