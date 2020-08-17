require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense Associations' do
    it { should belong_to(:user) }
  end

  describe 'Validations For Expense' do
    let(:expense) { build(:expense) }
    it 'should validate name\'s presence' do
      expense.name = ''
      expect(expense.save).to eq(false)
    end
    it 'name\'s length is greater than 1 character' do
      expense.name = 'r'
      expect(expense.save).to eq(false)
    end
    it 'should validate date_added is present' do
      expense.date_added = ''
      expect(expense.save).to eq(false)
    end
    it 'should validate amount' do
      expense.amount = 0
      expect(expense.save).to eq(false)
    end
  end

  describe 'Create valid expense' do
    let(:user) { build(:user) }
    let(:expense) { build(:expense) }
    it 'should save expense' do
      expense.user_id = user.id
      expect(expense.save).to eq(true)
    end
  end
end