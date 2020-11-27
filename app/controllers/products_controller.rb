class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @Product = Product.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :status_id, :fee_id, :place_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
