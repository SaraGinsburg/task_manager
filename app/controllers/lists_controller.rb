class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      @lists = List.all
      @new_list = List.new
      render :index
    end
  end

  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
    # @list.tasks.sort {|a, b| a.due_date <=> b.due_date}
    @new_task = Task.new
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
