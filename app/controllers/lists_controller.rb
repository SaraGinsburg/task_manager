class ListsController < ApplicationController
  def new
    @list = List.new
  end

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
  end

  def show
    @list = List.find(param[:id])
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
