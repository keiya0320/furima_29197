class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :definite, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
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

  def destroy
    @product.destroy
    redirect_to root_path if @product.destroy
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_days_id, :value).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def definite
    @product = Product.find(params[:id])
  end
end
