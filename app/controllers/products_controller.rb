class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:photo, :name, :explanation, :category, :condition, :postage_type, :prefecture, :preparation_days, :value, :user)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
