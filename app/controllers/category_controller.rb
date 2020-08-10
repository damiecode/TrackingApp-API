class CategoryController < ApplicationController
  def show_categories
    render json: Category.select(:id, :name, :description)
  end
end
