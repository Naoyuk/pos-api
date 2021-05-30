class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :update, :destroy]

  def index
    categories = Category.limit(18).order("created_at DESC")
    render json: { status: 'SUCCESS', message: 'Loaded categories', data: categories }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the category', data: @category }
  end

  def create
    category = Category.create(category_params)
    if category.save
      render json: { status: 'SUCCESS', data: category }
    else
      render json: { status: 'ERROR', data: category.errors }
    end
  end

  def update
    if @category.update(category_params)
      render json: { status: 'SUCCESS', data: @category }
    else
      render json: { status: 'ERROR', data: @category.errors }
    end
  end

  def destroy
    if @category.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the category', data: @category }
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
