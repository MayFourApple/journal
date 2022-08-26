class TasksController < ApplicationController

  def index 
    @category = Category.find(params[:category_id])
    @tasks = @category.tasks
  end

  def today
    @category = Category.find(params[:category_id])
    @tasks = Task.where(date: Date.today)
  end

  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new
  end

  def create
    @category = Category.find(params[:category_id])
    
    if @task = @category.tasks.create(task_params)
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy

    redirect_to category_path(@category), status: 303
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
