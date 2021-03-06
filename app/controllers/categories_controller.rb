class CategoriesController < ApplicationController
  before_action :verify_login
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category = Category.update(category_params)
    if @category.valid?
      @category.save
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
