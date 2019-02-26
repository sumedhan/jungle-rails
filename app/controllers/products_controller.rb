class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @average_rating = average_rating(params[:id])
  end
  
  private 
  def average_rating(id)
    Review.where(product_id: id).average("rating")  
  end

end
