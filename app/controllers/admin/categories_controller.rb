class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    # byebug
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
