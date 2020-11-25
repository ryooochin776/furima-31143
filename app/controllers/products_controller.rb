class ProductsController < ApplicationController
  #before_action :authenticate_user!, only: [:new]
  def index
  end


  def new
  end

  def create
    @product = product.create
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def product_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end

  
end
