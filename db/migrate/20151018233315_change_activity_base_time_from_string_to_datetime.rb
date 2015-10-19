class ChangeActivityBaseTimeFromStringToDatetime < ActiveRecord::Migration
  def change
    change_column :activities, :base_time, 'timestamp USING now()'
  end
end
