class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @user = current_user
    @product = Product.find_by(id: params[:product_id])
    review = Review.new(review_params)
    review.user = @user
    review.product = @product

    if review.save
      redirect_to @product, notice: 'Review Created'
    else
      redirect_to @product, notice: 'Review creation failed'
    end
  end

  def destroy
    @product = Product.find_by(id: params[:product_id])
    @review = Review.find_by(id: params[:id])
    @review.destroy

    redirect_to @product, notice: 'Review Deleted'
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end
