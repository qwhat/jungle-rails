class Admin::CategoriesController < ApplicationController
  #basic http authentication with our .env file
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    #lets admin add categories to the list
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
