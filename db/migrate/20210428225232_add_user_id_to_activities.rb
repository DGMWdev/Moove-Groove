class AddUserIdToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :user_id, :int
  end
end
