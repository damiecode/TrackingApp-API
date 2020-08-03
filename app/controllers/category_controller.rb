class CategoryController < ApplicationController
  def get_categories
    render json: Category.select(:id, :name, :description)
  end
end
