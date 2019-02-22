class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_name)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category Created!'
    else
      render [:admin, :categories]
    end
  end

  private

  def category_name
    params.require(:category).permit(
      :name
    )
  end
end
