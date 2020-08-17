class AddDateAddedToExpense < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :date_added, :date
  end
end
