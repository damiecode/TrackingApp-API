class ExpensesController < ApplicationController
  include SessionsHelper

  before_action :set_current_user

  def index
    @expenses = Expense.all.order(date: :desc).to_json(:include => :category)
    @currentTab = "expenses"
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: @expense.to_json(:include => [:category])
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    head :no_content
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      render json: @expense.to_json(:include => [:category])
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  private
    def expense_params
      params.require(:expense).permit(:date, :name, :category_id, :amount)
    end
end