class ExpensesController < ApplicationController
  include SessionsHelper

  before_action :set_current_user
  before_action :set_expense, only: %i[update destroy]

  def index
    @expenses = Expense.all.order(date: :desc)
    json_response(@expenses)
    @current_tab = 'expenses'
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    head :no_content
  end

  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :name, :amount)
  end

  def expense
    @expense = Expense.find(params[:id])
  end
end
