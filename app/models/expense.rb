class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, length: { in: 2..60 }, presence: true
  validates :date_added, presence: true
  validates :amount, presence: true
end
