class ReviewsController < ApplicationController
  def create
    product = Product.find_by_id(params[:product_id])
    review = product.reviews.build(review_params)
    review.user = current_user
    review.save
    redirect_to product
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
