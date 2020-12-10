class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: :index
  before_action :move_to_root_path, only: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building, :purchase_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user == @product.user
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_root_path
    if @product.purchase != nil
      redirect_to root_path
    end
  end





end
