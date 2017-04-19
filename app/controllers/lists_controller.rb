class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    if @list.save
      @list.shared_lists.build(user: current_user, permission: :owner).save
      redirect_to lists_path
    else
      raise params.inspect
      @lists = List.all
      @new_list = @list || List.new
      render :index
    end
  end

  def index
    @lists = List.all
    @new_list = List.new
    @new_list.shared_lists.build(user: current_user, permission: :collaborator)
  end

  def show
    @list = List.find(params[:id])
    # @list.tasks.sort {|a, b| a.due_date <=> b.due_date}
    @task = Task.new
  end

  private
  def list_params
    params.require(:list).permit(:name, user_ids:[])
  end
end
