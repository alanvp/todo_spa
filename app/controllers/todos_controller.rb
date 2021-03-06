class TodosController < ApplicationController
  def index
    @todos = Todo.all
    respond_to do |f|
      f.html
      f.json { render :json => @todos, only: [:id, :title, :completed]}
    end
  end

  def create
    todo_params = params.require(:todo).permit(:title, :completed)
    @todo = Todo.create(todo_params)

    respond_to do |f|
      f.json { render :json => @todo, only: [:id, :title, :completed] }
    end
  end

  # Fill in destroy
  def destroy
    id = params[:id]
    @todo = Todo.find(id)
    @todo.destroy
    respond_to do |f|

      f.json { render :json => @todos, only: [:id, :title, :completed]}
    end
  end

  # Fill in update
  def update
    binding.pry
    todo = params.require(:todo).permit(:id, :title, :completed)
    @todo = Todo.find(todo["id"])
    binding.pry
    @todo.update_attributes(todo)
    binding.pry
    respond_to do |f|
      f.json { render :json => @todos, only: [:id, :title, :completed]}
    end

  end
end
