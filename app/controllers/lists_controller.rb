class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render new_list_path
    end
  end

  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.sort {|a, b| a.due_date <=> b.due_date}
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
