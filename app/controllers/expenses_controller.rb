class ExpensesController < ApplicationController
  include SessionsHelper

  before_action :set_current_user
  before_action :set_expense, only: %i[show update destroy]

  def index
    @expenses = Expense.all.order(date: :desc)
    json_response(@expenses)
    @current_tab = 'expenses'
  end

  def create
    expense = @current_user.expenses.new(expense_params)

    if expense.save
      render json: {
        status: :created,
        expense: Expense.where(user: @current_user),
        selected_expense: expense
      }
    else
      render json: { status: 'ERROR', message: 'Expense could not be created!',
                     error: expense.errors.full_messages }, status: 500
    end
  end

  def show
    if expense
      render json: {
        status: :ok,
        expense: @expense_list,
        selected_expense: @selected_expense
      }
    else
      render json: { status: 'ERROR', message: 'Expense could not be found!',
                     error: @expense.errors.full_messages }, status: :unprocessable_entity
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

  def set_expense
    @expense = Expense.find(params[:id])
    @expense_list = Expense.where(user: @current_user)
    @selected_expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:date, :name, :amount)
  end
end
