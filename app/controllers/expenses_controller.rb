class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all.order(date: :desc).to_json
    @currentTab = "expenses"
  end

  def show
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: @expense.to_json
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
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def expense_params
      params.require(:expense).permit(:date, :name, :amount)
    end
end
