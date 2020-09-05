class OrdersController < ApplicationController
  before_action :move_to_session
  before_action :move_to_root
  before_action :sold_to_root


  def index
    @order = OrderInfo.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = OrderInfo.new(order_params)
    @product = Product.find(params[:product_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    @product = Product.find(params[:product_id])
    params.require(:order_info).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

  def pay_item
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.value,
      card: params[:token],
      currency:'jpy'
    )
  end

  private

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    @product = Product.find(params[:product_id])
    if @product.user_id == current_user.id
      redirect_to root_path
    end
  end

  def sold_to_root
    @product = Product.find(params[:product_id])
    if @product.order_info.present?
      redirect_to root_path
    end
  end



end
