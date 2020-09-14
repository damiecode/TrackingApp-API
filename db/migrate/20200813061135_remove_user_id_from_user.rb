class RemoveUserIdFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id, :bigint
  end
end
