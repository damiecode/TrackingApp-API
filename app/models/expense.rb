class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, :amount, :date_added, presence: true
  validates :name, length: { in: 2..60 }
end
