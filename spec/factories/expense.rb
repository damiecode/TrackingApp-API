FactoryBot.define do
  factory :expense, class: Expense do
    association :user
    name { 'Milk' }
    date_added { '2020-07-03' }
    amount { 100 }
  end
  factory :expense2, class: Expense do
    association :user
    name { 'Spaghetti' }
    date_added { '2020-07-04' }
    amount { 250 }
  end
end