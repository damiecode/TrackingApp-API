class AddMonthlyIncomeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :amount, :integer
    add_reference :users, :user, null: false, foreign_key: true
  end
end
