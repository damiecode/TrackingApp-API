class Saving < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :date_added, presence: true
  validates :plan, presence: true
end
