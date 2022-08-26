class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(user: current_user, **category_params)

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

  def show
    @category = current_user.categories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    return not_found
  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def not_found
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end
