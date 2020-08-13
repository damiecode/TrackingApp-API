class Saving < ApplicationRecord
  belongs_to :user
  validates :amount, :date_added, :plan, presence: true
end
