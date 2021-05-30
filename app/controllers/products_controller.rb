class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    products = Product.limit(15)
    render json: { status: 'SUCCESS', message: 'Loaded products', data: products }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the product', data: @product }
  end

  def create
    product = Product.create(product_params)
    if product.save
      render json: { status: 'SUCCESS', data: product }
    else
      render json: { status: 'ERROR', data: product.errors }
    end
  end

  def update
    if @product.update(product_params)
      render json: { status: 'SUCCESS', data: @product }
    else
      render json: { status: 'ERROR', data: @product.errors }
    end
  end

  def destroy
    if @product.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the product', data: @product }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end
end
