class CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :set_category, only: %I[show edit upddate destroy]

  def index
    @categories = Categories.all.includes(:articles)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'You created a new category!'
      redirect_to root_path
    else
      flash[:danger] = 'Something went wrong!'
      render 'new'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end