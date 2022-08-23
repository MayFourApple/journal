class CategoriesController < ApplicationController
  def index
    @categories = Category.all

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      render :show, status: :ok
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
